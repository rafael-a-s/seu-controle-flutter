import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control.entity.dart';

class User extends BaseEntity {
  final String firstName;
  final String lastName;
  final String cpf;
  final String email;
  final Set<String> roles;
  final FinanceControl financeControl;

  User(
      {dynamic id,
      required this.firstName,
      required this.lastName,
      required this.cpf,
      required this.email,
      required this.roles,
      required this.financeControl})
      : super(id: id);

  List<Object> get props => [
        id,
        firstName,
        lastName,
        cpf,
        email,
        roles,
        financeControl,
      ];
}
