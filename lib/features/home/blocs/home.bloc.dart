import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:clean_architeture_flutter/features/home/events/home.event.dart';
import 'package:clean_architeture_flutter/features/home/states/home.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HiveService hiveService;

  HomeBloc(this.hiveService): super(HomeStateEmpty()) {
    on<HomeEventGettedUser>(_gettedUser);
  }

  _gettedUser(HomeEventGettedUser event, emit) async {
    emit(HomeStateLoading());

    AuthUser authUser = await hiveService.getAuthUser();
    HomeStateGettedUser profileStateGettedUser = HomeStateGettedUser(authUser: authUser);

    emit(profileStateGettedUser);
  }
}