import 'package:clean_architeture_flutter/features/auth/data/datasource/auth_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/blocs/auth.bloc.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/datasource/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/auth/ui/pages/intro_login_page.dart';
import 'package:clean_architeture_flutter/features/auth/ui/pages/login_page.dart';
import 'package:clean_architeture_flutter/features/hive/hive.module.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  AuthModule();

  @override
  void binds(Injector i) {
    i.addInstance<FirebaseAuth>(FirebaseAuth.instance);
    i.addSingleton<GoogleAuthProvider>(GoogleAuthProvider.new);
    i.add<AuthDatasource>(() => AuthDatasourceImpl(i.get<FirebaseAuth>(), i.get<GoogleAuthProvider>()));
    i.addSingleton<AuthBloc>(() => AuthBloc(i.get<AuthDatasource>(), i.get<HiveService>()));
  }

  @override
  // TODO: implement imports
  List<Module> get imports => [
    HiveModule(),
  ];

  @override
  void routes(r) {
    r.child("/", child: (_) => const IntroLoginPage());
    r.child("/login", child: (_) => const LoginPage());
  }
}
