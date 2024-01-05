import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/monthlyContribution/monthly_contribution.model.dart';

abstract class MonthlyContributionDatasource
    extends IBaseDatasource<MonthlyContributionModel, dynamic> {
  MonthlyContributionDatasource({required super.api});
}
