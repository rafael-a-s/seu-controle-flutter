import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:clean_architeture_flutter/features/profile/events/profile.event.dart';
import 'package:clean_architeture_flutter/features/profile/states/profile.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final HiveService hiveService;

  ProfileBloc(this.hiveService): super(ProfileStateEmpty()) {
    on<ProfileEventGettedUser>(_gettedUser);
  }

  _gettedUser(ProfileEventGettedUser event, emit) async {
    emit(ProfileStateLoading());

    AuthUser authUser = await hiveService.getAuthUser();
    ProfileStateGettedUser profileStateGettedUser = ProfileStateGettedUser(authUser: authUser);

    emit(profileStateGettedUser);
  }
}