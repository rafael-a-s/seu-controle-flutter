import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/auth/login.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  final LoginUsecase loginUsecase;

  AuthLoginController(this.loginUsecase) : super(AuthLoginState.initial());

  Future<void> login(String cpf, String password) async {
    try {
      final params = TwoInputParams(cpf, password);

      state = state.copyWith(isLoading: true);

      await loginUsecase(params).then((value) => value.fold(
            (l) => {
              state = state.copyWith(error: l.toString()),
            },
            (r) => {
              state = state.copyWith(authUser: r),
            },
          ));
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
