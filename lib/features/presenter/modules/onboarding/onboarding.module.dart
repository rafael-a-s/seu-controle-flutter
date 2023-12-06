import 'package:clean_architeture_flutter/features/presenter/modules/home/home.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/onboarding/pages/onboarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [
    Bind.factory((i) => OnboardingModule()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const OnboardingPage(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute("/home", module: HomeModule())
      ];
}
