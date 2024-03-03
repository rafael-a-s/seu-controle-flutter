import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/controller/home.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/controller/start.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/pages/start.page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/submodule/financeControl/finance_control.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<HomeController>(HomeController.new);
    i.addSingleton<StartController>(StartController.new);
  }

  @override
  List<Module> get imports => [
        FinanceControlModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => const StartPage());
    r.module(AppRoutes.financeControl, module: FinanceControlModule());
  }
}
