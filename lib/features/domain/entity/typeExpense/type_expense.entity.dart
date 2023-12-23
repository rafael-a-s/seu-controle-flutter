import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';

class TypeExpense extends BaseEntity {
  final String nameOfExpense;
  final List<Expense> expenses;

  TypeExpense({
    dynamic id,
    required this.nameOfExpense,
    required this.expenses,
  }) : super(id: id);

  List<Object> get props => [
        id,
        nameOfExpense,
        expenses,
      ];
}
