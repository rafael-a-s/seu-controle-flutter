import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/typeExpense/create_type_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/typeExpense/edit_type_expense.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final formTypeExpenseStateProvider = StateNotifierProvider.autoDispose<
    FormTypeExpenseController, FormTypeExpenseState>((ref) {
  return Modular.get<FormTypeExpenseController>();
});

class FormTypeExpenseState extends BaseState {
  TypeExpense? typeExpense;

  FormTypeExpenseState(
      {required super.isLoading, required this.typeExpense, super.error});

  factory FormTypeExpenseState.inital() => FormTypeExpenseState(
        isLoading: false,
        typeExpense: TypeExpense(
          nameOfExpense: '',
          expenses: [],
        ),
      );

  FormTypeExpenseState copyWith({
    TypeExpense? typeExpense,
    bool? isLoading,
    String? error,
  }) {
    return FormTypeExpenseState(
        typeExpense: typeExpense ?? this.typeExpense,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class FormTypeExpenseController extends StateNotifier<FormTypeExpenseState> {
  CreateTypeExpenseUsecase createTypeExpenseUsecase;
  EditTypeExpenseUsecase editTypeExpenseUsecase;

  FormTypeExpenseController(
      this.createTypeExpenseUsecase, this.editTypeExpenseUsecase)
      : super(FormTypeExpenseState.inital());

  Future<void> createTypeExpense(TypeExpense typeExpense) async {
    try {
      state = state.copyWith(isLoading: true);

      await createTypeExpenseUsecase(typeExpense).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(typeExpense: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> editTypeExpense(TypeExpense typeExpense) async {
    try {
      state = state.copyWith(isLoading: true);

      await editTypeExpenseUsecase(typeExpense).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(typeExpense: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
