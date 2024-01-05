import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/data/datasource/auth/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/auth/auth_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repository/auth_impl.repository.dart';
import 'package:clean_architeture_flutter/features/domain/repository/auth_repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/auth/login.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/auth/sing_up.usecase.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/controller/auth_login.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/controller/auth_sing_up.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/intro_login_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/login_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/sign_up_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/home.module.dart';
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
          connectTimeout: 20000,
          receiveTimeout: 20000,
        ),
      ),
      config: BindConfig(
        onDispose: (dio) => dio.close(),
      ),
    );

    i.addSingleton<AuthDatasource>(AuthDatasourceImpl.new);
    i.addSingleton<AuthRepository>(AuthRepositoryImpl.new);
    i.add<LoginUsecase>(LoginUsecase.new);
    i.add<SingUpUsecase>(SingUpUsecase.new);
    i.add<AuthLoginController>(AuthLoginController.new);
    i.add<AuthSingUpController>(AuthSingUpController.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const IntroLoginPage());
    r.child("/login", child: (_) => const LoginPage());
    r.child("/sign-up", child: (_) => const SignUpPage());
    r.module(AppRoutes.home, module: HomeModule());
  }
}
