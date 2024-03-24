import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';

class MonthlyContributionAdapter {
  static MonthlyContribution fromJson(Map<String, dynamic> doc) {
    final user = doc['user'];
    return MonthlyContribution(
      userUid: user['uid'],
      nameInvestiment: doc['name'],
      value: doc['value'],
    );
  }

    static toJson(MonthlyContribution entity) => {
      'user': {
        'uid': entity.userUid,
      },
      'name': entity.nameInvestiment,
      'value': entity.value,
    };
  }

