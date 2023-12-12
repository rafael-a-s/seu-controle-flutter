import 'package:clean_architeture_flutter/features/data/datasource/auth/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/auth_user.model.dart';
import 'package:dio/dio.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final Dio client;

  AuthDatasourceImpl(this.client);

  @override
  Future<AuthUserModel> token(String cpf, String password) {
    // TODO: implement token
    throw UnimplementedError();
  }
}
