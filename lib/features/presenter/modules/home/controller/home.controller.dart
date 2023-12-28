import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeStateProvider =
    StateNotifierProvider.autoDispose<HomeController, HomeState>((ref) {
  return Modular.get<HomeController>();
});

class HomeState extends BaseState {
  AuthUser? authUser;

  HomeState({required super.isLoading, required this.authUser, super.error});

  factory HomeState.inital() => HomeState(
      isLoading: false,
      authUser: AuthUser(
          id: '', name: '', cpf: '', acessToken: '', roles: <String>{}));

  HomeState copyWith({
    AuthUser? authUser,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
        authUser: authUser ?? this.authUser,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.inital());

  Future<void> getUserLogged() async {
    try {
      state = state.copyWith(isLoading: true);
      var userLoggedBox = await Hive.openBox(AppKeyHive.userLogged);
      AuthUser authUser = userLoggedBox.get(AppKeyHive.getUserLogged);

      state = state.copyWith(authUser: authUser);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
