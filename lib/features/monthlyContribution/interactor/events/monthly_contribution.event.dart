import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';

sealed class MonthlyContributionEvent {
  const MonthlyContributionEvent();
}

class MonthlyContributionEventGet implements MonthlyContributionEvent{}
class MonthlyContributionEventGetAll implements MonthlyContributionEvent{}
class MonthlyContributionEventCreate implements MonthlyContributionEvent{
  final MonthlyContribution monthlyContribution;
  MonthlyContributionEventCreate({required this.monthlyContribution});
}
class MonthlyContributionEventUpdate implements MonthlyContributionEvent{
  final MonthlyContribution monthlyContribution;
  MonthlyContributionEventUpdate({required this.monthlyContribution});
}
class MonthlyContributionEventDelete implements MonthlyContributionEvent{}