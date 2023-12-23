import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';

class Expense extends BaseEntity {
  final String name;
  final String dayDiscount;
  final double value;
  final TypeExpense typeExpense;

  Expense({
    dynamic id,
    required this.name,
    required this.dayDiscount,
    required this.value,
    required this.typeExpense,
  }) : super(id: id);

  List<Object> get props => [
        id,
        name,
        dayDiscount,
        value,
        typeExpense,
      ];
}
