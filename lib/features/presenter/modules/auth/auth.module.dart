import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/auth/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/auth/auth_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repositorie/auth_impl.repository.dart';
import 'package:clean_architeture_flutter/features/domain/repositories/auth_repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/auth/login.usecase.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/controller/auth_login.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/intro_login_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/login_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/sign_up_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  AuthModule();

  @override
  void binds(Injector i) {
    i.addSingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: AppRoutesApi.baseUrl,
          connectTimeout: const Duration(seconds: 20).inSeconds,
          receiveTimeout: const Duration(seconds: 20).inSeconds,
        ),
      ),
      config: BindConfig(
        onDispose: (dio) => dio.close(),
      ),
    );

    i.addSingleton<AuthDatasource>(AuthDatasourceImpl.new);
    i.addSingleton<AuthRepository>(AuthRepositoryImpl.new);
    i.add<LoginUsecase>(LoginUsecase.new);
    i.add<AuthLoginController>(AuthLoginController.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const IntroLoginPage());
    r.child("/login", child: (_) => const LoginPage());
    r.child("/sign-up", child: (_) => const SignUpPage());
  }
}
