import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';

sealed class AuthState {}

class AuthStateLoading implements AuthState {

  const AuthStateLoading();
}

class AuthStateEmpty implements AuthState {

  const AuthStateEmpty();
}

class AuthStateLogout implements AuthState {
  const AuthStateLogout();
}

class AuthStateSucess implements AuthState {
  final AuthUser authUser;

  AuthStateSucess(this.authUser);
}

class AuthStateGetCurrentUser implements AuthState {
  final AuthUser authUser;

  AuthStateGetCurrentUser(this.authUser);
}

class AuthStateError implements AuthState {
  final String error;

  AuthStateError(this.error);
}
