import 'package:clean_architeture_flutter/features/auth/interactor/datasource/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/events/auth.event.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/states/auth_login.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDatasource datasource;

  AuthBloc(this.datasource): super(const AuthStateLogout()) {
    on<LoginAuthEvent>(_loginAuthEvent);
    on<LogoutAuthEvent>(_logoutAuthEvent);
  }

  void _loginAuthEvent(LoginAuthEvent event, emit) async {
    emit(const AuthStateLoading());
    final newState =  await datasource.login();
    emit(newState);
  }

  void _logoutAuthEvent(event, emit) async {
    emit(const AuthStateLoading());
    await datasource.logout();
    emit(const AuthStateLogout());
  }

}