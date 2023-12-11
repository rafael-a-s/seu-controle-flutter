import 'package:clean_architeture_flutter/features/domain/entity/user.entity.dart';

class UserModel extends User {
  UserModel(
      {String? id,
      required super.firstName,
      required super.lastName,
      required super.cpf,
      required super.email,
      required super.roles,
      required super.financeControl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    Set<String> roles = json['roles'].map((value) => value).toSet();

    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      cpf: json['cpf'],
      email: json['email'],
      roles: roles,
      financeControl: json['financeControl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'cpf': cpf,
        'email': email,
        'roles': roles,
        'financeControl': financeControl,
      };
}
