import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/user/user.entity.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/user/get_user.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileStateProvider =
    StateNotifierProvider.autoDispose<ProfileController, ProfileState>((ref) {
  return Modular.get<ProfileController>();
});

class ProfileState extends BaseState {
  User? user;

  ProfileState({required super.isLoading, required this.user, super.error});

  factory ProfileState.inital() => ProfileState(
      isLoading: false,
      user: User(
          firstName: '',
          lastName: '',
          cpf: '',
          email: '',
          roles: <String>{},
          financeControl: FinanceControl(
              expensesFixes: [], monthlyContributions: [], remunerations: [])));

  ProfileState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return ProfileState(
        user: user ?? this.user,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class ProfileController extends StateNotifier<ProfileState> {
  GetUserUsecase getUserUsecase;

  ProfileController(this.getUserUsecase) : super(ProfileState.inital());

  Future<void> getUser(String id) async {
    try {
      state = state.copyWith(isLoading: true);

      await getUserUsecase(id).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(user: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      state = state.copyWith(isLoading: true);

      var userLoggedBox = await Hive.openBox(AppKeyHive.userLogged);
      userLoggedBox.delete(AppKeyHive.getUserLogged);
      userLoggedBox.clear();
      userLoggedBox.close();

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
