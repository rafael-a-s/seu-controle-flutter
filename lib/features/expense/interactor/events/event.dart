import 'package:clean_architeture_flutter/features/expense/interactor/entity/expense.entity.dart';

sealed class ExpenseEvent {
  const ExpenseEvent();
}

class ExpenseEventGet implements ExpenseEvent{}
class ExpenseEventGetAll implements ExpenseEvent{}
class ExpenseEventCreate implements ExpenseEvent{
  final Expense expense;
  ExpenseEventCreate({required this.expense});
}
class ExpenseEventUpdate implements ExpenseEvent{
  final Expense expense;
  ExpenseEventUpdate({required this.expense});
}
class ExpenseEventDelete implements ExpenseEvent{}