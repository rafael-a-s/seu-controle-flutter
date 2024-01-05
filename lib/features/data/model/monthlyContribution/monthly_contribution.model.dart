import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';

class MonthlyContributionModel extends MonthlyContribution {
  MonthlyContributionModel({
    String? id,
    required super.nameInvestiment,
    required super.value,
  });

  factory MonthlyContributionModel.fromJson(Map<String, dynamic> json) {
    return MonthlyContributionModel(
      id: json['id'],
      nameInvestiment: json['nameInvestiment'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameInvestiment': nameInvestiment,
        'value': value,
      };
}
