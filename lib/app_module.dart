import 'package:clean_architeture_flutter/app_widget.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/onboarding/onboarding.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => AppWidgetController()),
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/onboarding', module: OnboardingModule()),
      ];
}
