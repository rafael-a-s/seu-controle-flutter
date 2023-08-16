import 'package:clean_architeture_flutter/features/presenter/modules/exemplo/pages/list/list.page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExemploModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const ListExemplo(),
          transition: TransitionType.rightToLeft,
        ),
      ];
}
