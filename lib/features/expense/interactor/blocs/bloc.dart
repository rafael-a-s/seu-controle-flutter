import 'package:clean_architeture_flutter/features/expense/interactor/datasource/datasource.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/events/event.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/states/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseBloc
    extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseDatasource datasource;

  ExpenseBloc({required this.datasource})
      : super(ExpenseStateEmpty()) {
    on<ExpenseEventCreate>(_create);
    on<ExpenseEventGetAll>(_getAll);
    on<ExpenseEventUpdate>(_update);
  }

  _create(ExpenseEventCreate event, emit) async {
    try {
      emit(ExpenseStateLoading());
      await datasource.create(event.expense);
    } catch (e) {
      emit(const ExpenseStateError(
          error: "Contribuição mensal não cadastrada."));
    }
  }

  _update(ExpenseEventUpdate event, emit) async {
    try {
      emit(ExpenseStateLoading());
      await datasource.update(event.expense);
    } catch (e) {
      emit(const ExpenseStateError(
          error: "Contribuição mensal não foi atualizada."));
    }
  }

  _getAll(ExpenseEventGetAll event, emit) async {
    try {
      emit(ExpenseStateLoading());
      final newState = await datasource.getAll();
      emit(ExpenseStateGetted(list: newState));
    } catch (e) {
      emit(const ExpenseStateError(
          error: "Ocorreu um erro ao buscar seus registros."));
    }
  }
}
