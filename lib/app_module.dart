import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/auth/auth.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/onboarding/onboarding.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/profile/profile.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/start.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  AppModule();

  @override
  void binds(i) {

  }

  @override
  void routes(r) {
    r.module("/", module: OnboardingModule());
    r.module(AppRoutes.start, module: StartModule());
    r.module(AppRoutes.auth, module: AuthModule());
    r.module(AppRoutes.profile, module: ProfileModule());
  }
}
