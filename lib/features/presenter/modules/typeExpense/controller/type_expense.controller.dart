import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/typeExpense/delete_type_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/typeExpense/get_all_type_expense.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final typeExpenseStateProvider =
    StateNotifierProvider.autoDispose<TypeExpenseController, TypeExpenseState>(
        (ref) {
  return Modular.get<TypeExpenseController>();
});

class TypeExpenseState extends BaseState {
  List<TypeExpense>? typeExpense;

  TypeExpenseState({
    required super.isLoading,
    required this.typeExpense,
    super.error,
  });

  factory TypeExpenseState.inital() => TypeExpenseState(
        isLoading: false,
        typeExpense: <TypeExpense>[],
      );

  TypeExpenseState copyWith({
    List<TypeExpense>? typeExpense,
    bool? isLoading,
    String? error,
  }) {
    return TypeExpenseState(
      typeExpense: typeExpense ?? this.typeExpense,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class TypeExpenseController extends StateNotifier<TypeExpenseState> {
  GetAllTypeExpenseUsecase getAllTypeExpenseUsecase;
  DeleteTypeExpenseUsecase deleteTypeExpenseUsecase;

  TypeExpenseController(
    this.getAllTypeExpenseUsecase,
    this.deleteTypeExpenseUsecase,
  ) : super(TypeExpenseState.inital());

  Future<void> getAllTypeExpense() async {
    try {
      state = state.copyWith(isLoading: true);

      await getAllTypeExpenseUsecase(NoParams()).then(
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

  Future<void> deleteTypeExpense(String id) async {
    try {
      state = state.copyWith(isLoading: true);

      await deleteTypeExpenseUsecase(id);

      await getAllTypeExpenseUsecase(NoParams()).then(
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
