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
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      notelp: fields[3] as String,
      asal: fields[4] as String,
      role: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserLoggedInState obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.notelp)
      ..writeByte(4)
      ..write(obj.asal)
      ..writeByte(5)
      ..write(obj.role);
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