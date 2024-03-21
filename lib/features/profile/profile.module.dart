import 'package:clean_architeture_flutter/features/hive/hive.module.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:clean_architeture_flutter/features/profile/blocs/profile.bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  ProfileModule();

  @override
  // TODO: implement imports
  List<Module> get imports => [
    HiveModule(),
  ];

  @override
  void binds(Injector i) {
    i.addSingleton(() => ProfileBloc(i.get<HiveService>()));
  }

}
