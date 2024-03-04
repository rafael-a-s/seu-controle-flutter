import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class AuthUser extends HiveObject {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? photoURL;

  AuthUser({
    required this.uid,
    required this.name,
    this.email,
    this.photoURL,
  });
}
