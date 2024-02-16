import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/expense/delete_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/expense/get_all_of_type_expense.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final expenseStateProvider =
    StateNotifierProvider.autoDispose<ExpenseController, ExpenseState>((ref) {
  return Modular.get<ExpenseController>();
});

class ExpenseState extends BaseState {
  List<Expense>? expense;

  ExpenseState({
    required super.isLoading,
    required this.expense,
    super.error,
  });

  factory ExpenseState.inital() => ExpenseState(
        isLoading: false,
        expense: <Expense>[],
      );

  ExpenseState copyWith({
    List<Expense>? expense,
    bool? isLoading,
    String? error,
  }) {
    return ExpenseState(
      expense: expense ?? this.expense,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ExpenseController extends StateNotifier<ExpenseState> {
  GetAllOfTypeExpense getAllOfTypeExpense;
  DeleteExpenseUsecase deleteExpenseUsecase;

  ExpenseController(
    this.getAllOfTypeExpense,
    this.deleteExpenseUsecase,
  ) : super(ExpenseState.inital());

  Future<void> getAllExpense(String idTypeExpense) async {
    try {
      state = state.copyWith(isLoading: true);

      await getAllOfTypeExpense(idTypeExpense).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(expense: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> deleteExpense(String id, String idTypeExpense) async {
    try {
      state = state.copyWith(isLoading: true);

      await deleteExpenseUsecase(id);

      await getAllOfTypeExpense(idTypeExpense).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(expense: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
