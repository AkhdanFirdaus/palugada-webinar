// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserGuestStateAdapter extends TypeAdapter<UserGuestState> {
  @override
  final int typeId = 0;

  @override
  UserGuestState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserGuestState(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserGuestState obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGuestStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserLoggedInStateAdapter extends TypeAdapter<UserLoggedInState> {
  @override
  final int typeId = 1;

  @override
  UserLoggedInState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLoggedInState(
      name: fields[0] as String,
      email: fields[1] as String,
      notelp: fields[2] as String,
      password: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserLoggedInState obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.notelp)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLoggedInStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
