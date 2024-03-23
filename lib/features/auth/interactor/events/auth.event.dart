import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class LoginAuthEvent extends AuthEvent {}

class LogoutAuthEvent extends AuthEvent {}

class GetUserCurrentAuthUserEvent extends AuthEvent {}

class SucessLoginAuthEvent extends AuthEvent {
  final AuthUser authUser;

  const SucessLoginAuthEvent({required this.authUser});
}