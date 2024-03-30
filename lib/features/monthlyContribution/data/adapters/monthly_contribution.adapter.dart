import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';

class MonthlyContributionAdapter {
  static MonthlyContribution fromJson(Map<String, dynamic> doc, String id) {
    //final user = doc['userId'];
    return MonthlyContribution(
      id: id,
      userUid: doc['userId'],
      nameInvestiment: doc['name'],
      value: doc['value'],
    );
  }

    static toJson(MonthlyContribution entity) => {
      'userId': entity.userUid,
      'name': entity.nameInvestiment,
      'value': entity.value,
    };
  }

