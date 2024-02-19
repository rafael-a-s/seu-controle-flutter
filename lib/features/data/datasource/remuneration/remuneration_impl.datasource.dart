import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/data/datasource/remuneration/remuneration.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/remuneration/remuneration.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:hive/hive.dart';

class RemunerationDatasourceImpl
    extends BaseDatasource<RemunerationModel, dynamic>
    implements RemunerationDatasource {
  final JsonModelConvert<RemunerationModel> jsonModelConvert = JsonModelConvert(
    fromJson: (data) => RemunerationModel.fromJson(data),
    toJson: (data) => data.toJson(),
  );

  void configureDio() async {
    var box = await Hive.openBox(AppKeyHive.userLogged);
    AuthUser token = box.get(AppKeyHive.getUserLogged);

    client.options.headers.addAll({
      "Authorization": "Bearer ${token.acessToken}",
    });
  }

  RemunerationDatasourceImpl({required super.client, required super.api}) {
    configureDio();
  }

  @override
  JsonModelConvert<RemunerationModel> getJsonConvert() {
    return jsonModelConvert;
  }
}
