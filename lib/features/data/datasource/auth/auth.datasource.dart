import 'package:clean_architeture_flutter/features/data/model/auth/auth_user.model.dart';

abstract class AuthDatasource {
  Future<AuthUserModel> singInWithGoogle();
  Future<String> logout();
}
