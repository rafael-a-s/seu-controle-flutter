import 'package:clean_architeture_flutter/features/presenter/modules/profile/pages/profile.page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  final List<Bind> binds = [
    Bind.factory((i) => ProfileModule()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      "/",
      child: (_, __) => const ProfilePage(),
      transition: TransitionType.leftToRight,
    ),
  ];
}