// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationTypeAdapter extends TypeAdapter<NotificationType> {
  @override
  final int typeId = 5;

  @override
  NotificationType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NotificationType.mention;
      case 1:
        return NotificationType.friendRequest;
      default:
        return NotificationType.mention;
    }
  }

  @override
  void write(BinaryWriter writer, NotificationType obj) {
    switch (obj) {
      case NotificationType.mention:
        writer.writeByte(0);
        break;
      case NotificationType.friendRequest:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChatMessageAdapter extends TypeAdapter<ChatMessage> {
  @override
  final int typeId = 1;

  @override
  ChatMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatMessage(
      thread: fields[0] as Thread,
      message: fields[1] as String,
      time: fields[2] as DateTime,
      id: fields[5] as int,
      senderName: fields[3] as String,
      isMe: fields[6] as bool,
      msgType: fields[7] as String,
      base64string: fields[8] as String,
      ext: fields[9] as String,
      filePath: fields[11] as String,
    )
      ..haveReceived = fields[4] as bool
      ..haveReachedServer = fields[10] as bool
      ..hasSeen = fields[12] as bool;
  }

  @override
  void write(BinaryWriter writer, ChatMessage obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.thread)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.senderName)
      ..writeByte(4)
      ..write(obj.haveReceived)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.isMe)
      ..writeByte(7)
      ..write(obj.msgType)
      ..writeByte(8)
      ..write(obj.base64string)
      ..writeByte(9)
      ..write(obj.ext)
      ..writeByte(10)
      ..write(obj.haveReachedServer)
      ..writeByte(11)
      ..write(obj.filePath)
      ..writeByte(12)
      ..write(obj.hasSeen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThreadAdapter extends TypeAdapter<Thread> {
  @override
  final int typeId = 2;

  @override
  Thread read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Thread(
      first: fields[0] as User,
      second: fields[1] as User,
    )
      ..chatList = (fields[2] as List)?.cast<ChatMessage>()
      ..lastAccessed = fields[3] as DateTime
      ..isTyping = fields[4] as bool
      ..hasUnseen = fields[5] as int
      ..isOnline = fields[6] as bool
      ..lastSeen = fields[7] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Thread obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.first)
      ..writeByte(1)
      ..write(obj.second)
      ..writeByte(2)
      ..write(obj.chatList)
      ..writeByte(3)
      ..write(obj.lastAccessed)
      ..writeByte(4)
      ..write(obj.isTyping)
      ..writeByte(5)
      ..write(obj.hasUnseen)
      ..writeByte(6)
      ..write(obj.isOnline)
      ..writeByte(7)
      ..write(obj.lastSeen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThreadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 3;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      username: fields[0] as String,
      userDpUrl: fields[1] as String,
      postUrl: fields[2] as String,
      likeCount: fields[3] as int,
      commentCount: fields[4] as int,
      postId: fields[5] as int,
      haveLiked: fields[6] as bool,
      userId: fields[7] as int,
      type: fields[8] as String,
      caption: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.userDpUrl)
      ..writeByte(2)
      ..write(obj.postUrl)
      ..writeByte(3)
      ..write(obj.likeCount)
      ..writeByte(4)
      ..write(obj.commentCount)
      ..writeByte(5)
      ..write(obj.postId)
      ..writeByte(6)
      ..write(obj.haveLiked)
      ..writeByte(7)
      ..write(obj.userId)
      ..writeByte(8)
      ..write(obj.type)
      ..writeByte(9)
      ..write(obj.caption);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeedAdapter extends TypeAdapter<Feed> {
  @override
  final int typeId = 4;

  @override
  Feed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Feed()..posts = (fields[0] as List)?.cast<Post>();
  }

  @override
  void write(BinaryWriter writer, Feed obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.posts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NotificationsAdapter extends TypeAdapter<Notifications> {
  @override
  final int typeId = 6;

  @override
  Notifications read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notifications(
      type: fields[0] as NotificationType,
      userName: fields[1] as String,
      userId: fields[2] as int,
      timeCreated: fields[3] as DateTime,
      notifId: fields[5] as int,
    )..hasAccepted = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, Notifications obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.timeCreated)
      ..writeByte(4)
      ..write(obj.hasAccepted)
      ..writeByte(5)
      ..write(obj.notifId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StoryAdapter extends TypeAdapter<Story> {
  @override
  final int typeId = 7;

  @override
  Story read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Story(
      file: fields[0] as String,
      views: fields[1] as int,
      time: fields[2] as DateTime,
      viewed: fields[3] as bool,
      storyId: fields[4] as int,
      notificationId: fields[5] as int,
    )..viewedUsers = (fields[6] as List)?.cast<StoryUser>();
  }

  @override
  void write(BinaryWriter writer, Story obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.file)
      ..writeByte(1)
      ..write(obj.views)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.viewed)
      ..writeByte(4)
      ..write(obj.storyId)
      ..writeByte(5)
      ..write(obj.notificationId)
      ..writeByte(6)
      ..write(obj.viewedUsers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserStoryModelAdapter extends TypeAdapter<UserStoryModel> {
  @override
  final int typeId = 8;

  @override
  UserStoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserStoryModel(
      username: fields[0] as String,
      userId: fields[1] as int,
      stories: (fields[2] as List)?.cast<Story>(),
    )..timeOfLastStory = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, UserStoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.stories)
      ..writeByte(3)
      ..write(obj.timeOfLastStory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StoryUserAdapter extends TypeAdapter<StoryUser> {
  @override
  final int typeId = 9;

  @override
  StoryUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoryUser(
      username: fields[2] as String,
      viewedTime: fields[4] as DateTime,
    )
      ..fName = fields[0] as String
      ..lName = fields[1] as String
      ..profilePicture = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, StoryUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.fName)
      ..writeByte(1)
      ..write(obj.lName)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.profilePicture)
      ..writeByte(4)
      ..write(obj.viewedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoryUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
