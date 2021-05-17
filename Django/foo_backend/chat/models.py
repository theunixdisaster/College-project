from django.db import models
from django.db.models import Q
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.utils import timezone
from django.db.models.signals import post_save
# Create your models here.


# =============================
# Custom user model and manager
# =============================
class UserManager(BaseUserManager):
    def create_user(self, email, password=None):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_staffuser(self, email, password):
        """
        Creates and saves a staff user with the given email and password.
        """
        user = self.create_user(
            email,
            password=password,
        )
        user.staff = True
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password):
        """
        Creates and saves a superuser with the given email and password.
        """
        user = self.create_user(
            email,
            password=password,
        )
        user.staff = True
        user.admin = True
        user.save(using=self._db)
        return user



class User(AbstractBaseUser):
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )
    f_name = models.CharField(max_length=50)
    l_name = models.CharField(max_length=50)
    username = models.CharField(max_length=50,)
    uprn = models.IntegerField(null=True,blank=False,unique=True)
    token = models.CharField(max_length=240,null=True,unique=True)
    dob = models.DateField(null=True,blank=True)
    is_active = models.BooleanField(default=True)
    staff = models.BooleanField(default=False) # a admin user; non super-user
    admin = models.BooleanField(default=False) # a superuser

    # notice the absence of a "Password field", that is built in.

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = [] # Email & Password are required by default.


    objects = UserManager()

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        return self.staff

    @property
    def is_admin(self):
        "Is the user a admin member?"
        return self.admin


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    online = models.BooleanField(default=False)
    last_seen = models.DateTimeField(auto_now=False, auto_now_add=True)


    friends = models.ManyToManyField(User, related_name="friends")

    def __str__(self):
        return f'{self.user.email}'



class ThreadManager(models.Manager):

    def get_or_new(self,user,username):
       
        first_username = user.username
        first_lookup = Q(first__username=first_username) & Q(second__username=username)
        second_lookup = Q(first__username=username) & Q(second__username=first_username)
        qs =  self.get_queryset().filter(first_lookup | second_lookup).distinct()
        if qs.count() == 1:
            return qs.first()
        else:
            Klass = user.__class__
            other_user = Klass.objects.all().get(username=username)
            if user != other_user:
                obj = self.model(
                    first = user,
                    second=other_user
                )
                obj.save()
                return obj
        



class Thread(models.Model):
    first  = models.ForeignKey(User,related_name="first_thred", on_delete=models.CASCADE)
    second  = models.ForeignKey(User,related_name="second_thread", on_delete=models.CASCADE)

    objects = ThreadManager()

    def __str__(self):
        return f'{self.first.email}-{self.second.email}'





class ChatMessage(models.Model):

    MSG_TYPES = (('msg','msg'),('img','img'),('aud','aud'))

    thread = models.ForeignKey(Thread, on_delete=models.CASCADE)
    user   = models.ForeignKey(User, related_name="sender", on_delete=models.CASCADE)
    message = models.TextField(null=True,blank=True)
    time_created = models.CharField(max_length=30,null=True)
    recipients = models.ManyToManyField(User)
    msg_type = models.CharField(max_length=3,null=True,blank=True,choices=MSG_TYPES)
    base64string = models.TextField(null=True,blank=True)
    extension = models.CharField(max_length=10,null=True,blank=True)

    def received(self):
        if self.recipients.all().count() == 2:
            return True
        return False

class Notification(models.Model):

    NOTIF_TYPES = (('seen','seen'),('received','received'))

    chatmsg_id = models.IntegerField()
    notif_from = models.ForeignKey(User, related_name="from_user_chat", on_delete=models.CASCADE)
    notif_to = models.ForeignKey(User, related_name="to_user_chat", on_delete=models.CASCADE)
    notif_type = models.CharField(max_length=10,choices=NOTIF_TYPES)

def user_directory_path(instance, filename):
    extension = filename.split(".")[-1]
    return 'user_{0}/{1}'.format(instance.user.id, filename[:4]+'.'+extension)
  

class Post(models.Model):
    
    user = models.ForeignKey(User, related_name="posts", on_delete=models.CASCADE)
    file = models.FileField(upload_to = user_directory_path)
    post_type = models.CharField(max_length=5)
    time_created = models.DateTimeField(auto_now_add=True)
    caption = models.CharField(max_length=100)

    likes = models.ManyToManyField(User,related_name="likes")


    def have_liked(self,user):
        if user in likes:
            return True
        return False
        

class Comment(models.Model):

    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    comment = models.CharField(max_length=1000)
    time_created = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE,related_name="mentions")
    mentions = models.ManyToManyField(User)




class FriendRequest(models.Model):

    STATES = (('pending','pending'),('accepted','accepted'),('rejected','rejected'))


    from_user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="from_user")
    to_user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="to_user")
    status = models.CharField(max_length=10, choices=STATES)
    has_received = models.BooleanField(default=False)




def user_story_directory_path(instance, filename):
    extension = filename.split(".")[-1]
    return 'user_{0}/stories/{1}'.format(instance.user.id, filename[:4]+'.'+extension)
  
class Story(models.Model):

    user = models.ForeignKey(User, related_name="stories", on_delete=models.CASCADE)
    file = models.FileField(upload_to=user_story_directory_path)
    time_created = models.DateTimeField(auto_now_add=True)
    views = models.ManyToManyField(User, related_name="story_views")

class StoryNotification(models.Model):
    STORY_NOTIF_TYPES = (('story_add','story_add'),('story_del','story_del'))

    story = models.ForeignKey(Story, on_delete=models.CASCADE)
    to_user = models.ForeignKey(User, on_delete=models.CASCADE)
    notif_type = models.CharField(max_length=15,choices=STORY_NOTIF_TYPES)
