import 'package:clean_architeture_flutter/features/remuneration/interactor/datasource/datasource.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/events/event.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/states/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonthlyContributinoBloc
    extends Bloc<RemunerationEvent, RemunerationState> {
  final RemunerationDatasource datasource;

  MonthlyContributinoBloc({required this.datasource})
      : super(RemunerationStateEmpty()) {
    on<RemunerationEventCreate>(_create);
    on<RemunerationEventGetAll>(_getAll);
    on<RemunerationEventUpdate>(_update);
  }

  _create(RemunerationEventCreate event, emit) async {
    try {
      emit(RemunerationStateLoading());
      await datasource.create(event.remuneration);
    } catch (e) {
      emit(const RemunerationStateError(
          error: "Contribuição mensal não cadastrada."));
    }
  }

  _update(RemunerationEventUpdate event, emit) async {
    try {
      emit(RemunerationStateLoading());
      await datasource.update(event.remuneration);
    } catch (e) {
      emit(const RemunerationStateError(
          error: "Contribuição mensal não foi atualizada."));
    }
  }

  _getAll(RemunerationEventGetAll event, emit) async {
    try {
      emit(RemunerationStateLoading());
      final newState = await datasource.getAll();
      emit(RemunerationStateGetted(list: newState));
    } catch (e) {
      emit(const RemunerationStateError(
          error: "Ocorreu um erro ao buscar seus registros."));
    }
  }
}
