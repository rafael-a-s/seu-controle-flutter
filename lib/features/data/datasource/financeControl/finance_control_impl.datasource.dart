import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/financeControl/finance_control.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/financeControl/finance_control.model.dart';
import 'package:clean_architeture_flutter/features/data/model/financeControl/finance_control_metric.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control.entity.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class FinanceControlDatasourceImpl
    extends BaseDatasource<FinanceControl, String>
    implements FinanceControlDatasource {
  JsonModelConvert<FinanceControlModel> convert = JsonModelConvert(
    fromJson: (json) => FinanceControlModel.fromJson(json),
    toJson: (convert) => convert.toJson(), //nao implementado
  );

  void configureDio() async {
    var box = await Hive.openBox(AppKeyHive.userLogged);
    AuthUser token = box.get(AppKeyHive.getUserLogged);

    client.options.headers.addAll({
      "Authorization": "Bearer ${token.acessToken}",
    });
  }

  FinanceControlDatasourceImpl({required super.client, required super.api}) {
    configureDio();
  }

  @override
  JsonModelConvert<FinanceControl> getJsonConvert() {
    return convert;
  }

  @override
  Future<FinanceControlMetricModel> financeControlMetrics() async {
    try {
      final response = await client.get(AppRoutesApi.financeControlMetrics);
      final data = response.data;
      return FinanceControlMetricModel.fromJson(data);
    } on DioError catch (e) {
      throw DioError(requestOptions: RequestOptions(path: ""), error: e.error);
    }
  }
}
