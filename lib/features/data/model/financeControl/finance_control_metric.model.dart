import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control_metric.entity.dart';

class FinanceControlMetricModel extends FinanceControlMetric {
  FinanceControlMetricModel(
    double subTotalForMonth,
    double totalExpenses,
    double totalInvestimentMonth,
    double totalRemuneration,
    double totalSpendForWeek,
  ) : super(
          subTotalForMonth: subTotalForMonth,
          totalExpenses: totalExpenses,
          totalInvestimentMonth: totalInvestimentMonth,
          totalRemuneration: totalRemuneration,
          totalSpendForWeek: totalSpendForWeek,
        );

  factory FinanceControlMetricModel.fromJson(Map<String, dynamic> json) =>
      FinanceControlMetricModel(
        json['subTotalForMonth'],
        json['totalExpenses'],
        json['totalInvestimentMonth'],
        json['totalRemuneration'],
        json['totalSpendForWeek'],
      );
}
