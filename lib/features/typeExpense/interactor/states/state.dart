import 'package:clean_architeture_flutter/features/typeExpense/interactor/entity/type_expense.entity.dart';

sealed class TypeExpenseState {
  const TypeExpenseState();
}

class TypeExpenseStateLoading implements TypeExpenseState {}

class TypeExpenseStateEmpty implements TypeExpenseState {}

class TypeExpenseStateGetted implements TypeExpenseState {
  final List<TypeExpense> list;

  const TypeExpenseStateGetted({required this.list});
}
class TypeExpenseStateError implements TypeExpenseState {
  final String error;

  const TypeExpenseStateError({required this.error});
}