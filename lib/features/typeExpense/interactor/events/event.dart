import 'package:clean_architeture_flutter/features/typeExpense/interactor/entity/type_expense.entity.dart';

sealed class TypeExpenseEvent {
  const TypeExpenseEvent();
}

class TypeExpenseEventGet implements TypeExpenseEvent{}
class TypeExpenseEventGetAll implements TypeExpenseEvent{}
class TypeExpenseEventCreate implements TypeExpenseEvent{
  final TypeExpense typeExpense;
  TypeExpenseEventCreate({required this.typeExpense});
}
class TypeExpenseEventUpdate implements TypeExpenseEvent{
  final TypeExpense typeExpense;
  TypeExpenseEventUpdate({required this.typeExpense});
}
class TypeExpenseEventDelete implements TypeExpenseEvent{}