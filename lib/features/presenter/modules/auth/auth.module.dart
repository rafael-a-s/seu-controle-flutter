import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/intro_login_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/login_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/pages/sign_up_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  AuthModule();

  @override
  void binds(Injector i) {}

  @override
  void routes(r) {
    r.child("/", child: (_) => const IntroLoginPage());
    r.child("/login", child: (_) => const LoginPage());
    r.child("/sign-up", child: (_) => const SignUpPage());
  }
}
