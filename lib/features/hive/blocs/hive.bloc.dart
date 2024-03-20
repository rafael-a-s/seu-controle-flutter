import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';
import 'package:clean_architeture_flutter/features/hive/events/hive.event.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:clean_architeture_flutter/features/hive/states/hive.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {

  final HiveService service;

  HiveBloc(this.service): super(HiveStateLogout()) {
    on<HiveEventPutUser>(_putUser);
    on<HiveEventPopUser>(_popUser);
  }

  _putUser(HiveEventPutUser putEvent, emit) {
    service.put(putEvent.user);
  }

  _popUser(event, emit) {
    service.pop();
  }
}