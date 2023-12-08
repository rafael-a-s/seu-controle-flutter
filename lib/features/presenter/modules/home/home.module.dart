import 'package:clean_architeture_flutter/features/presenter/modules/home/pages/home_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/profile/profile.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [
    Bind.factory((i) => HomeModule()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const HomePage(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute("/profile", module: ProfileModule())
      ];
}
