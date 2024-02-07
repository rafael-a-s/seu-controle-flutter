import 'package:clean_architeture_flutter/features/data/model/expense/expense.model.dart';
import 'package:clean_architeture_flutter/features/data/model/monthlyContribution/monthly_contribution.model.dart';
import 'package:clean_architeture_flutter/features/data/model/remuneration/remuneration.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control.entity.dart';

class FinanceControlModel extends FinanceControl {
  FinanceControlModel({
    String? id,
    required super.expensesFixes,
    required super.monthlyContributions,
    required super.remunerations,
  }) : super(id: id);

  FinanceControlModel fromJson(Map<String, dynamic> json) {
    final monthlyContributionsConvert = json['monthlyContributions']
        .map((value) => MonthlyContributionModel.fromJson(value));

    final expensesConvert =
        json['expensesFixes'].map((value) => ExpenseModel.fromJson(value));

    final remunerationConvert =
        json['remunerations'].map((value) => RemunerationModel.fromJson(value));

    return FinanceControlModel(
      id: json['id'],
      expensesFixes: expensesConvert,
      monthlyContributions: monthlyContributionsConvert,
      remunerations: remunerationConvert,
    );
  }
}
