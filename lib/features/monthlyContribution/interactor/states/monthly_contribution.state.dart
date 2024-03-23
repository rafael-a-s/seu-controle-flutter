import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';

sealed class MonthlyContributionState {
  const MonthlyContributionState();
}

class MonthlyContributionStateLoading implements MonthlyContributionState {}

class MonthlyContributionStateEmpty implements MonthlyContributionState {}

class MonthlyContributionStateGetted implements MonthlyContributionState {
  final List<MonthlyContribution> list;

  const MonthlyContributionStateGetted({required this.list});
}
class MonthlyContributionStateError implements MonthlyContributionState {
  final String error;

  const MonthlyContributionStateError({required this.error});
}