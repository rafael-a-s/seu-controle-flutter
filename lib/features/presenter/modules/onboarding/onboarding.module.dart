import 'package:clean_architeture_flutter/features/presenter/modules/auth/auth.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/onboarding/pages/onboarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingModule extends Module {
  OnboardingModule();

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const OnboardingPage());
    r.module("/auth", module: AuthModule());
  }
}
