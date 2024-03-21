import 'package:clean_architeture_flutter/features/auth/interactor/datasource/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/events/auth.event.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/states/auth_login.state.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDatasource datasource;
  final HiveService hiveService;

  AuthBloc(this.datasource, this.hiveService): super(const AuthStateLogout()) {
    on<LoginAuthEvent>(_loginAuthEvent);
    on<LogoutAuthEvent>(_logoutAuthEvent);
    on<SucessLoginAuthEvent>(_sucessLogin);
  }

  void _sucessLogin(SucessLoginAuthEvent event, emit) {
    if(state is AuthStateSucess) {
      hiveService.put(event.authUser);
      Modular.to.pushNamed(AppRoutes.start);
    }
  }

  void _loginAuthEvent(LoginAuthEvent event, emit) async {
    emit(const AuthStateLoading());
    final newState =  await datasource.login();
    emit(newState);
  }

  void _logoutAuthEvent(event, emit) async {
    emit(const AuthStateLoading());
    await datasource.logout();
    await hiveService.pop();
    emit(const AuthStateLogout());
  }

}