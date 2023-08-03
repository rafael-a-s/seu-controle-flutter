import 'package:clean_architeture_flutter/app_widget.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/home.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => AppWidgetController()),
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
      ];
}
