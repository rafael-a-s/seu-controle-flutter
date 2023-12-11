import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/data/datasource/user/user.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/user.model.dart';

class UserDatasourceImpl extends BaseDatasource<UserModel, dynamic>
    implements UserDatasource {
  final JsonModelConvert<UserModel> jsonModelConvert = JsonModelConvert(
    fromJson: (data) => UserModel.fromJson(data),
    toJson: (convert) => convert.toJson(),
  );

  UserDatasourceImpl({required super.client, required super.api});

  @override
  JsonModelConvert<UserModel> getJsonConvert() {
    return jsonModelConvert;
  }
}
