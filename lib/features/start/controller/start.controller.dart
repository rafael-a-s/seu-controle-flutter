import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/financeControl/finance_control_metrics.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final startStateProvider =
    StateNotifierProvider.autoDispose<StartController, StartState>((ref) {
  return Modular.get<StartController>();
});

class StartState extends BaseState {
  StartState({required super.isLoading, super.error});

  factory StartState.inital() => StartState(
        isLoading: false,
      );

  StartState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return StartState(
        isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
  }
}

class StartController extends StateNotifier<StartState> {
  FinanceControlMetricsUsecase financeControlMetricsUsecase;

  StartController(this.financeControlMetricsUsecase)
      : super(StartState.inital());
}
