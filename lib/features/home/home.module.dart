import 'package:clean_architeture_flutter/features/hive/hive.module.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:clean_architeture_flutter/features/home/blocs/home.bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  HomeModule();

  @override
  // TODO: implement imports
  List<Module> get imports => [
    HiveModule(),
  ];

  @override
  void binds(Injector i) {
    i.addSingleton(() => HomeBloc(i.get<HiveService>()));
  }

}
