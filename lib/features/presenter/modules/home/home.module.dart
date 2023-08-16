import 'package:clean_architeture_flutter/features/presenter/modules/exemplo/exemplo.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/controllers/home.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/pages/home.page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [
    Bind.factory((i) => HomeController()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const HomePage(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute('/exemplo', module: ExemploModule()),
      ];
}
