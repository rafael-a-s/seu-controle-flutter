import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/data/datasource/remuneration/remuneration.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/remuneration/remuneration.model.dart';

class RemunerationDatasourceImpl
    extends BaseDatasource<RemunerationModel, dynamic>
    implements RemunerationDatasource {
  final JsonModelConvert<RemunerationModel> jsonModelConvert = JsonModelConvert(
    fromJson: (data) => RemunerationModel.fromJson(data),
    toJson: (data) => data.toJson(),
  );

  RemunerationDatasourceImpl({required super.client, required super.api});

  @override
  JsonModelConvert<RemunerationModel> getJsonConvert() {
    return jsonModelConvert;
  }
}
