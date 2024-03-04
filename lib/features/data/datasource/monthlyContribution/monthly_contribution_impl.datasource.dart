import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/data/datasource/monthlyContribution/monthly_contribution.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/monthlyContribution/monthly_contribution.model.dart';

class MonthlyContributionDatasourceImpl
    extends BaseDatasource<MonthlyContributionModel, dynamic>
    implements MonthlyContributionDatasource {
  final JsonModelConvert<MonthlyContributionModel> jsonModelConvert =
      JsonModelConvert(
    fromJson: (data) => MonthlyContributionModel.fromJson(data),
    toJson: (data) => data.toJson(),
  );

  MonthlyContributionDatasourceImpl(
      {required super.client, required super.api});

  @override
  JsonModelConvert<MonthlyContributionModel> getJsonConvert() {
    return jsonModelConvert;
  }
}
