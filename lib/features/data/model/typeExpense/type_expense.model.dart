import 'package:clean_architeture_flutter/features/data/model/expense/expense.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';

class TypeExpenseModel extends TypeExpense {
  TypeExpenseModel({
    String? id,
    required super.nameOfExpense,
    required super.expenses,
  }) : super(id: id);

  factory TypeExpenseModel.fromJson(Map<String, dynamic> json) {
    final listExpenses = json['expenses']
        .map((value) => ExpenseModel.fromJson(value))
        .toList()
        .cast<Expense>();

    return TypeExpenseModel(
      id: json['id'],
      nameOfExpense: json['nameOfExpense'],
      expenses: listExpenses,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameOfExpense': nameOfExpense,
        'expenses': expenses,
      };

  Map<String, dynamic> toJsonCreate() => {
        'nameOfExpense': nameOfExpense,
      };
}
