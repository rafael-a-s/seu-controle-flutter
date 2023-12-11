import 'package:clean_architeture_flutter/features/presenter/modules/profile/pages/profile.page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  ProfileModule();

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const ProfilePage());
  }
}
