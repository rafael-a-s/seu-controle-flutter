import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/datasource/monthly_contribution.datasource.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/events/monthly_contribution.event.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/states/monthly_contribution.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonthlyContributinoBloc extends Bloc<MonthlyContributionEvent, MonthlyContributionState> {
  final MonthlyContributionDatasource datasource;
  MonthlyContributinoBloc({required this.datasource}): super(MonthlyContributionStateEmpty()){
    on<MonthlyContributionEventCreate>(_create);
    on<MonthlyContributionEventGetAll>(_getAll);
  }

  _create(MonthlyContributionEventCreate event, emit) async {
    try {
      emit(MonthlyContributionStateLoading());
      await datasource.create(event.monthlyContribution);
      emit(MonthlyContributionStateEmpty());
    } catch (e) {
      emit(const MonthlyContributionStateError(error: "Contribuição mensal não cadastrada."));
    }
  }

  _getAll(MonthlyContributionEventGetAll event, emit) async {
    try {
      emit(MonthlyContributionStateLoading());
      final newState = await datasource.getAll();
      emit(MonthlyContributionStateGetted(list: newState));
    } catch (e) {
      emit(const MonthlyContributionStateError(error: "Ocorreu um erro ao buscar seus registros."));
    }
  }

}