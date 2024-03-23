import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';

sealed class HomeState {
  const HomeState();
}

class HomeStateLoading implements HomeState {}

class HomeStateEmpty implements HomeState {}

class HomeStateError implements HomeState {
  final String error;

  const HomeStateError({required this.error});
}

class HomeStateGettedUser implements HomeState {
  final AuthUser authUser;

  const HomeStateGettedUser({required this.authUser});
}