import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/user/user.entity.dart';

class FinanceControl extends BaseEntity {
  final List<Remuneration> remunerations;
  final List<Expense> expensesFixes;
  final List<MonthlyContribution> monthlyContributions;
  final User user;

  FinanceControl(
      {dynamic id,
      required this.expensesFixes,
      required this.monthlyContributions,
      required this.remunerations,
      required this.user})
      : super(id: id);

  List<Object> get props => [
        id,
        expensesFixes,
        monthlyContributions,
        remunerations,
        user,
      ];
}
