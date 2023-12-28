import 'package:clean_architeture_flutter/features/presenter/modules/home/controller/home.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/pages/home_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/profile/profile.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    i.add<HomeController>(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const HomePage());
    r.module("/profile", module: ProfileModule());
  }
}
