import 'package:clean_architeture_flutter/features/home/home.module.dart';
import 'package:clean_architeture_flutter/features/profile/profile.module.dart';
import 'package:clean_architeture_flutter/features/start/ui/pages/start.page.dart';
import 'package:clean_architeture_flutter/features/user/user.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartModule extends Module {
  @override
  void binds(Injector i) {
  }

  @override
  List<Module> get imports => [
        ProfileModule(),
        HomeModule(),
        UserModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => const StartPage());
  }
}
