import 'package:clean_architeture_flutter/features/domain/entity/auth_user.dart';

class AuthUserModel extends AuthUser {
  AuthUserModel({
    required super.id,
    required super.name,
    required super.cpf,
    required super.acessToken,
    required super.roles,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    Set<String> roles = json['roles'].map((value) => value).toSet();

    return AuthUserModel(
      id: json['id'],
      name: json['name'],
      cpf: json['cpf'],
      acessToken: json['acessToken'],
      roles: roles,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cpf': cpf,
        'acessToken': acessToken,
        'roles': roles,
      };
}
