// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
    )..vechile = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.vechile)
      ..writeByte(4)
      ..write(obj.usertype)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.password);
  }
}
