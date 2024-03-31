import 'package:clean_architeture_flutter/features/expense/interactor/entity/expense.entity.dart';

class ExpenseAdapter {
  static Expense fromJson(Map<String, dynamic> doc, String id) {
    return Expense(
      id: id,
      name: doc['name'],
      value: doc['value'],
      dayDiscount: doc['dayDiscount'],
    );
  }

  static toJson(Expense entity) => {
        'name': entity.name,
        'value': entity.value,
        'dayDiscount': entity.dayDiscount,
      };
}
