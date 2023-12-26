import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/auth/sing_up.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authSingUpStateProvider =
    StateNotifierProvider.autoDispose<AuthSingUpController, AuthSingUpState>(
        (ref) {
  return Modular.get<AuthSingUpController>();
});

class AuthSingUpState extends BaseState {
  String? uri;

  AuthSingUpState({required super.isLoading, required this.uri, super.error});

  factory AuthSingUpState.inital() =>
      AuthSingUpState(isLoading: false, uri: '');

  AuthSingUpState copyWith({
    String? uri,
    bool? isLoading,
    String? error,
  }) {
    return AuthSingUpState(
        isLoading: isLoading ?? this.isLoading,
        uri: uri ?? this.uri,
        error: error ?? this.error);
  }
}

class AuthSingUpController extends StateNotifier<AuthSingUpState> {
  final SingUpUsecase singUpUsecase;

  AuthSingUpController(this.singUpUsecase) : super(AuthSingUpState.inital());

  Future<void> singUp(Map<String, dynamic> user) async {
    try {
      state = state.copyWith(isLoading: true);
      singUpUsecase(user).then((value) => value.fold(
            (l) => {
              state = state.copyWith(error: l.toString()),
            },
            (r) => state = state.copyWith(isLoading: false, uri: r),
          ));
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
