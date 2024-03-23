import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';

abstract class MonthlyContributionDatasource
    extends IBaseDatasource<MonthlyContribution, dynamic> {
  MonthlyContributionDatasource({required super.api});
}
