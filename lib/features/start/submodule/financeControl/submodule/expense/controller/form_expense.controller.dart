import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/expense/create_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/expense/edit_expense.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final formExpenseStateProvider =
    StateNotifierProvider.autoDispose<FormExpenseController, FormExpenseState>(
        (ref) {
  return Modular.get<FormExpenseController>();
});

class FormExpenseState extends BaseState {
  Expense? expense;

  FormExpenseState(
      {required super.isLoading, required this.expense, super.error});

  factory FormExpenseState.inital() => FormExpenseState(
      isLoading: false,
      expense: Expense(
          name: '',
          value: 0,
          dayDiscount: '',
  ));

  FormExpenseState copyWith({
    Expense? expense,
    bool? isLoading,
    String? error,
  }) {
    return FormExpenseState(
        expense: expense ?? this.expense,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class FormExpenseController extends StateNotifier<FormExpenseState> {
  CreateExpenseUsecase createExpenseUsecase;
  EditExpenseUsecase editExpenseUsecase;

  FormExpenseController(this.createExpenseUsecase, this.editExpenseUsecase)
      : super(FormExpenseState.inital());

  Future<void> createExpense(Expense expense) async {
    try {
      state = state.copyWith(isLoading: true);

      await createExpenseUsecase(expense).then(
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

  Future<void> editExpense(Expense expense) async {
    try {
      state = state.copyWith(isLoading: true);

      await editExpenseUsecase(expense).then(
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
