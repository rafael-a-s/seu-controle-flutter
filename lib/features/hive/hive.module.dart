import 'package:clean_architeture_flutter/features/hive/blocs/hive.bloc.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive_impl.service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

class HiveModule extends Module {

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<HiveService>(() => HiveServiceImpl(Hive));
    i.addInstance(() => HiveBloc(i.get<HiveService>()));
  }
}