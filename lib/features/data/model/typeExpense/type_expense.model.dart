import 'package:clean_architeture_flutter/features/data/model/expense/expense.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';

class TypeExpenseModel extends TypeExpense {
  TypeExpenseModel({
    String? id,
    required super.nameOfExpense,
    super.expenses,
  }) : super(id: id);

  factory TypeExpenseModel.fromJson(Map<String, dynamic> json) {
    List<Expense> listExpenses = [];
    if (json.containsKey('expenses')) {
      listExpenses = json['expenses']
          .map((value) => ExpenseModel.fromJsonNoTypeExpense(value))
          .toList()
          .cast<Expense>();
    }

    return TypeExpenseModel(
      id: json['id'],
      nameOfExpense: json['nameOfExpense'],
      expenses: listExpenses,
    );
  }

  factory TypeExpenseModel.fromJsonNoExpense(Map<String, dynamic> json) {
    return TypeExpenseModel(
      id: json['id'],
      nameOfExpense: json['nameOfExpense'] ?? '',
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
