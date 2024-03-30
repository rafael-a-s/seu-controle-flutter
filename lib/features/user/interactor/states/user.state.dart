import 'package:clean_architeture_flutter/features/user/interactor/entity/user.entity.dart';

sealed class UserState {}

class UserStateLoading implements UserState {

  const UserStateLoading();
}

class UserStateEmpty implements UserState {

  const UserStateEmpty();
}

class UserStateNew implements UserState {}

class UserStateOld implements UserState {}

class UserStateCreate implements UserState {
  final UserFirebase userFirebase;

  const UserStateCreate({required this.userFirebase});
}

class UserStateGetted implements UserState {
  final UserFirebase userFirebase;

  const UserStateGetted({required this.userFirebase});
}

class UserStateError implements UserState {
  final String error;

  UserStateError(this.error);
}
