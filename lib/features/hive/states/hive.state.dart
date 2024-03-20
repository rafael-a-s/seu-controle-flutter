import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';

sealed class HiveState {}

class HiveStateLogged implements HiveState {
  final AuthUser user;

  const HiveStateLogged({required this.user});
}

class HiveStateLogout implements HiveState {}