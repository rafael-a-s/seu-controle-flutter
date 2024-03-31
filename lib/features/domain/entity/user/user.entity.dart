import 'package:clean_architeture_flutter/core/domain/base.entity.dart';

class User extends BaseEntity {
  final String firstName;
  final String lastName;
  final String cpf;
  final String email;
  final Set<String> roles;

  User(
      {dynamic id,
      required this.firstName,
      required this.lastName,
      required this.cpf,
      required this.email,
      required this.roles,
      })
      : super(id: id);

  List<Object> get props => [
        id,
        firstName,
        lastName,
        cpf,
        email,
        roles,
      ];
}
