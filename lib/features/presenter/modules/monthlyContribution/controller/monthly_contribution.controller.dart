import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/monthlyContribution/get_all_monthly_contribution.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final monthlyContributionStateProvider = StateNotifierProvider.autoDispose<
    MonthlyContributionController, MonthlyContributionState>((ref) {
  return Modular.get<MonthlyContributionController>();
});

class MonthlyContributionState extends BaseState {
  List<MonthlyContribution>? monthlyContributions;

  MonthlyContributionState(
      {required super.isLoading,
      required this.monthlyContributions,
      super.error});

  factory MonthlyContributionState.inital() => MonthlyContributionState(
      isLoading: false, monthlyContributions: <MonthlyContribution>[]);

  MonthlyContributionState copyWith({
    List<MonthlyContribution>? monthlyContributions,
    bool? isLoading,
    String? error,
  }) {
    return MonthlyContributionState(
        monthlyContributions: monthlyContributions ?? this.monthlyContributions,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class MonthlyContributionController
    extends StateNotifier<MonthlyContributionState> {
  GetAllMonthlyContributionUsecase getAllMonthlyContributionUsecase;

  MonthlyContributionController(this.getAllMonthlyContributionUsecase)
      : super(MonthlyContributionState.inital());

  Future<void> getAllMonthlyContribution() async {
    try {
      state = state.copyWith(isLoading: true);

      await getAllMonthlyContributionUsecase(NoParams()).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(monthlyContributions: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
