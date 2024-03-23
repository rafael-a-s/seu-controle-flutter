import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/user/user.entity.dart';

class FinanceControl extends BaseEntity {
  final List<Remuneration> remunerations;
  final List<Expense> expensesFixes;
  final User? user;

  FinanceControl(
      {dynamic id,
      required this.expensesFixes,
      required this.remunerations,
      this.user})
      : super(id: id);

  List<Object> get props => [
        id,
        expensesFixes,
        remunerations,
        user!,
      ];
}
