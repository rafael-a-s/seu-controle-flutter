import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/auth/login_with_google.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authLoginStateProvider =
    StateNotifierProvider.autoDispose<AuthLoginController, AuthLoginState>(
        (ref) {
  return Modular.get<AuthLoginController>();
});

class AuthLoginState extends BaseState<AuthLoginState> {
  AuthUser? authUser;

  AuthLoginState({this.authUser, required super.isLoading, super.error});

  factory AuthLoginState.initial() => AuthLoginState(isLoading: false);

  AuthLoginState copyWith({
    AuthUser? authUser,
    bool? isLoading,
    String? error,
  }) {
    return AuthLoginState(
        authUser: authUser ?? this.authUser,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class AuthLoginController extends StateNotifier<AuthLoginState> {
  final LoginWithGoogleUsecase loginWithGoogleUsecase;

  AuthLoginController(this.loginWithGoogleUsecase)
      : super(AuthLoginState.initial());

  Future<void> login() async {
    try {
      state = state.copyWith(isLoading: true);

      await loginWithGoogleUsecase(NoParams()).then((value) => value.fold(
            (l) => {
              state = state.copyWith(error: l.toString()),
            },
            (r) => {
              _saveUserLogged(r),
              _redirectIfLoginSucess(),
            },
          ));
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  _redirectIfLoginSucess() => Modular.to.pushNamed(AppRoutes.start);

  _saveUserLogged(AuthUser authUser) async {
    var box = await Hive.openBox(AppKeyHive.userLogged);

    box.put(AppKeyHive.getUserLogged, authUser);
  }
}
