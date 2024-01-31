import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/data/datasource/monthlyContribution/monthly_contribution.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/monthlyContribution/monthly_contribution.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:hive/hive.dart';

class MonthlyContributionDatasourceImpl
    extends BaseDatasource<MonthlyContributionModel, dynamic>
    implements MonthlyContributionDatasource {
  final JsonModelConvert<MonthlyContributionModel> jsonModelConvert =
      JsonModelConvert(
    fromJson: (data) => MonthlyContributionModel.fromJson(data),
    toJson: (convert) => convert.toJson(),
  );

  void configureDio() async {
    var box = await Hive.openBox(AppKeyHive.userLogged);
    AuthUser token = box.get(AppKeyHive.getUserLogged);

    client.options.headers.addAll({
      "Authorization": "Bearer ${token.acessToken}",
    });
  }

  MonthlyContributionDatasourceImpl(
      {required super.client, required super.api}) {
    configureDio();
  }

  @override
  JsonModelConvert<MonthlyContributionModel> getJsonConvert() {
    return jsonModelConvert;
  }
}
