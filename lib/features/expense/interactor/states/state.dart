import 'package:clean_architeture_flutter/features/expense/interactor/entity/expense.entity.dart';

sealed class ExpenseState {
  const ExpenseState();
}

class ExpenseStateLoading implements ExpenseState {}

class ExpenseStateEmpty implements ExpenseState {}

class ExpenseStateGetted implements ExpenseState {
  final List<Expense> list;

  const ExpenseStateGetted({required this.list});
}
class ExpenseStateError implements ExpenseState {
  final String error;

  const ExpenseStateError({required this.error});
}