// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:hive/hive.dart';

class AuthUserAdapter extends TypeAdapter<AuthUser> {
  @override
  final int typeId = 0;

  @override
  AuthUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    Set<String> roles = (fields[4] as List)?.cast<String>()?.toSet() ?? {};
    return AuthUser(
      id: fields[0] as String,
      name: fields[1] as String,
      cpf: fields[2] as String,
      acessToken: fields[3] as String,
      roles: roles,
    );
  }

  @override
  void write(BinaryWriter writer, AuthUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.cpf)
      ..writeByte(3)
      ..write(obj.acessToken)
      ..writeByte(4)
      ..write(obj.roles.toList());
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
