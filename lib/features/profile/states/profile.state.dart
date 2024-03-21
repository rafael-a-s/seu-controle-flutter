import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';

sealed class ProfileState {
  const ProfileState();
}

class ProfileStateLoading implements ProfileState {}

class ProfileStateEmpty implements ProfileState {}

class ProfileStateError implements ProfileState {
  final String error;

  const ProfileStateError({required this.error});
}

class ProfileStateGettedUser implements ProfileState {
  final AuthUser authUser;

  const ProfileStateGettedUser({required this.authUser});
}