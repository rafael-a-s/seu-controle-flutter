import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/auth/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/auth/auth_request.model.dart';
import 'package:clean_architeture_flutter/features/data/model/auth/auth_user.model.dart';
import 'package:clean_architeture_flutter/features/data/model/user/user_sing_up.model.dart';
import 'package:dio/dio.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final JsonModelConvert<AuthUserModel> jsonModelConvert = JsonModelConvert(
    fromJson: (data) => AuthUserModel.fromJson(data),
    toJson: (convert) => convert.toJson(),
  );

  final Dio _client;

  AuthDatasourceImpl(this._client);

  @override
  Future<AuthUserModel> token(String cpf, String password) async {
    final authRequest = AuthRequest(cpf, password);
    final authRequestJson = authRequest.toJson();

    final authUserResponse = await client.post(
      AppRoutesApi.authLogin,
      data: authRequestJson,
    );

    return getConvert().fromJson(authUserResponse.data);
  }

  @override
  Future<String> singUp(UserSingUpModel userSingUpModel) async {
    final singUpRequestJson = userSingUpModel.toJson();

    final uriUserResponse =
        await client.post(AppRoutesApi.userRegister, data: singUpRequestJson);

    return uriUserResponse.headers.value('Location')!;
  }

  Dio get client => _client;

  @override
  JsonModelConvert<AuthUserModel> getConvert() {
    return jsonModelConvert;
  }
}
