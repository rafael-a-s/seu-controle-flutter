import 'package:clean_architeture_flutter/features/auth/interactor/states/auth_login.state.dart';

abstract interface class AuthDatasource {

  Future<AuthState> login();

  Future<AuthState> logout();

  AuthState getUser();
}
