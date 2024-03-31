import 'package:clean_architeture_flutter/features/typeExpense/interactor/datasource/datasource.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/events/event.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/states/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeExpenseBloc
    extends Bloc<TypeExpenseEvent, TypeExpenseState> {
  final TypeExpenseDatasource datasource;

  TypeExpenseBloc({required this.datasource})
      : super(TypeExpenseStateEmpty()) {
    on<TypeExpenseEventCreate>(_create);
    on<TypeExpenseEventGetAll>(_getAll);
    on<TypeExpenseEventUpdate>(_update);
  }

  _create(TypeExpenseEventCreate event, emit) async {
    try {
      emit(TypeExpenseStateLoading());
      await datasource.create(event.typeExpense);
    } catch (e) {
      emit(const TypeExpenseStateError(
          error: "Contribuição mensal não cadastrada."));
    }
  }

  _update(TypeExpenseEventUpdate event, emit) async {
    try {
      emit(TypeExpenseStateLoading());
      await datasource.update(event.typeExpense);
    } catch (e) {
      emit(const TypeExpenseStateError(
          error: "Contribuição mensal não foi atualizada."));
    }
  }

  _getAll(TypeExpenseEventGetAll event, emit) async {
    try {
      emit(TypeExpenseStateLoading());
      final newState = await datasource.getAll();
      emit(TypeExpenseStateGetted(list: newState));
    } catch (e) {
      emit(const TypeExpenseStateError(
          error: "Ocorreu um erro ao buscar seus registros."));
    }
  }
}
