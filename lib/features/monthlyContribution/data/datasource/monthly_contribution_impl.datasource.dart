import 'package:clean_architeture_flutter/core/data/datasources/base_firebase.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/datasource/monthly_contribution.datasource.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';

class MonthlyContributionDatasourceImpl
    extends BaseDatasourceFirebase<MonthlyContribution, dynamic>
    implements MonthlyContributionDatasource {
  MonthlyContributionDatasourceImpl(
      {required super.client, required super.api});

  @override
  JsonModelConvert<MonthlyContribution> getJsonConvert() {
    // TODO: implement getJsonConvert
    throw UnimplementedError();
  }


}
