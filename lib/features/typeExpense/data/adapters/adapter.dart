import 'package:clean_architeture_flutter/features/typeExpense/interactor/entity/type_expense.entity.dart';

class TypeExpenseAdapter {
  static TypeExpense fromJson(Map<String, dynamic> doc, String id) {
    return TypeExpense(
      id: id,
      name: doc['name'],
    );
  }

  static toJson(TypeExpense entity) => {
        'name': entity.name,
      };
}
