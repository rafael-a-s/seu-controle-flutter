import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/data/model/auth/auth_user.model.dart';

abstract class AuthDatasource {
  Future<AuthUserModel> token(String cpf, String password);
  JsonModelConvert<AuthUserModel> getConvert();
}
