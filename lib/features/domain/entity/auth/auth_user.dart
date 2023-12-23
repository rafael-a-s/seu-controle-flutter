import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class AuthUser extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String cpf;

  @HiveField(3)
  final String acessToken;

  @HiveField(4)
  final Set<String> roles;

  AuthUser({
    required this.id,
    required this.name,
    required this.cpf,
    required this.acessToken,
    required this.roles,
  });

  List<Object> get props => [
        id,
        name,
        cpf,
        acessToken,
        roles,
      ];
}
