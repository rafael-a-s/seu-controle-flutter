import 'package:clean_architeture_flutter/features/data/model/auth_user.model.dart';

abstract class AuthDatasource {
  Future<AuthUserModel> token(String cpf, String password);
}
