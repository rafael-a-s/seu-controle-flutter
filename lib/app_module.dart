import 'package:clean_architeture_flutter/features/presenter/modules/onboarding/onboarding.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  AppModule();

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module("/", module: OnboardingModule());
  }
}
