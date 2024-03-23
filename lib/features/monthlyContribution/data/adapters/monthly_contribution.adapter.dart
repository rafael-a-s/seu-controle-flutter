import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';

class MonthlyContributionAdapter {
  static MonthlyContribution fromJson(Map<String, dynamic> map) {
    final user = map['user'];
    return MonthlyContribution(
      id: map['id'],
      userUid: user['uid'],
      nameInvestiment: map['name'],
      value: map['value'],
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

