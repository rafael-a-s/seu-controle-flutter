import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/monthlyContribution/create_monthly_contribution.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final formMonthlyContributionStateProvider = StateNotifierProvider.autoDispose<
    FormMonthlyContributionController, FormMonthlyContributionState>((ref) {
  return Modular.get<FormMonthlyContributionController>();
});

class FormMonthlyContributionState extends BaseState {
  MonthlyContribution? monthlyContribution;

  FormMonthlyContributionState(
      {required super.isLoading,
      required this.monthlyContribution,
      super.error});

  factory FormMonthlyContributionState.inital() => FormMonthlyContributionState(
      isLoading: false,
      monthlyContribution: MonthlyContribution(
        nameInvestiment: '',
        value: 0,
      ));

  FormMonthlyContributionState copyWith({
    MonthlyContribution? monthlyContribution,
    bool? isLoading,
    String? error,
  }) {
    return FormMonthlyContributionState(
        monthlyContribution: monthlyContribution ?? this.monthlyContribution,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class FormMonthlyContributionController
    extends StateNotifier<FormMonthlyContributionState> {
  CreateMonthlyContributionUsecase createMonthlyContributionUsecase;

  FormMonthlyContributionController(this.createMonthlyContributionUsecase)
      : super(FormMonthlyContributionState.inital());

  Future<void> createMonthlyContribution(
      MonthlyContribution monthlyContribution) async {
    try {
      state = state.copyWith(isLoading: true);

      await createMonthlyContributionUsecase(monthlyContribution).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(monthlyContribution: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
