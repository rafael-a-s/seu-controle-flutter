import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';

class ExpenseModel extends Expense {
  ExpenseModel({
    String? id,
    required super.name,
    required super.dayDiscount,
    required super.value,
    super.typeExpense,
  }) : super(id: id);

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json['id'],
        name: json['name'],
        dayDiscount: json['dayDiscount'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'dayDiscount': value,
      };

  Map<String, dynamic> toJsonCreate() => {
        'name': name,
        'value': value,
        'dayDiscount': dayDiscount,
        'typeExpense': {'id': typeExpense!.id},
      };
}
