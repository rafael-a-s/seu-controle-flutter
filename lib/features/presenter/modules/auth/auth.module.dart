import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/intro_login_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/login_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/home.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [
    Bind.factory((i) => AuthModule()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const IntroLoginPage(),
          transition: TransitionType.leftToRight,
        ),
        ChildRoute(
          "/login",
          child: (_, __) => const LoginPage(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute("/home", module: HomeModule())
      ];
}
