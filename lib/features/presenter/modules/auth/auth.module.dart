import 'package:clean_architeture_flutter/features/data/datasource/auth/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/auth/auth_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repository/auth_impl.repository.dart';
import 'package:clean_architeture_flutter/features/domain/repository/auth_repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/auth/login_with_google.usecase.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/controller/auth_login.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/intro_login_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  AuthModule();

  @override
  void binds(Injector i) {
    i.addInstance<FirebaseAuth>(FirebaseAuth.instance);
    i.addSingleton<GoogleAuthProvider>(GoogleAuthProvider.new);
    i.addSingleton<AuthDatasource>(AuthDatasourceImpl.new);
    i.addSingleton<AuthRepository>(AuthRepositoryImpl.new);
    i.add<LoginWithGoogleUsecase>(LoginWithGoogleUsecase.new);
    i.add<AuthLoginController>(AuthLoginController.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const IntroLoginPage());
    r.child("/login", child: (_) => const LoginPage());
  }
}
