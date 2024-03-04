import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';

class AuthUserModel extends AuthUser {
  AuthUserModel({
    required super.uid,
    required super.name,
    required super.email,
    required super.photoURL,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      photoURL: json['photoURL'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'photoURL': photoURL,
      };
}
