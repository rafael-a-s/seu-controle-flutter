import 'package:clean_architeture_flutter/core/data/datasources/base_firebase.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/data/adapters/monthly_contribution.adapter.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/datasource/monthly_contribution.datasource.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';

class MonthlyContributionDatasourceImpl
    extends BaseDatasourceFirebase<MonthlyContribution, dynamic>
    implements MonthlyContributionDatasource {
  final JsonModelConvert<MonthlyContribution> jsonModelConvert =
  JsonModelConvert(
    fromJson: (data) => MonthlyContributionAdapter.fromJson(data),
    toJson: (data) => MonthlyContributionAdapter.toJson(data),
  );

  MonthlyContributionDatasourceImpl(
      {required super.client, required super.api});

  @override
  JsonModelConvert<MonthlyContribution> getJsonConvert() {
    return jsonModelConvert;
  }
}
