import 'package:clean_architeture_flutter/features/presenter/modules/drawer/pages/drawer_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [
    Bind.factory((i) => DrawerModule()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const DrawerPage(),
          transition: TransitionType.leftToRight,
        ),
      ];
}
