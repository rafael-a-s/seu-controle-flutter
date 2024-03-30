import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:clean_architeture_flutter/features/user/interactor/datasource/user.datasource.dart';
import 'package:clean_architeture_flutter/features/user/interactor/entity/user.entity.dart';
import 'package:clean_architeture_flutter/features/user/interactor/events/user.event.dart';
import 'package:clean_architeture_flutter/features/user/interactor/states/user.state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserDatasource datasource;
  final HiveService hiveService;

  UserBloc(this.datasource, this.hiveService): super(const UserStateEmpty()) {
   on<CreateUserEvent>(_createUser);
   on<ValideUserAfterLoginUserEvent>(_validateUserAfterLogin);
  }

  void _validateUserAfterLogin(ValideUserAfterLoginUserEvent event, emit) async {
    emit(const UserStateLoading());

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final newState = await datasource.getUser(uid);

    if(newState is UserStateEmpty) {
      emit(UserStateNew());
      add(CreateUserEvent(userFirebase: UserFirebase(uid: uid, isNew: true)));
    }

    emit(UserStateOld());
  }

  void _createUser(CreateUserEvent event, emit) async {
    final newState = await datasource.create(event.userFirebase);
    emit(newState);
  }


}