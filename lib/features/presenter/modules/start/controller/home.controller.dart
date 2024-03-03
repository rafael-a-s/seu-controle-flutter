import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control_metric.entity.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/financeControl/finance_control_metrics.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeStateProvider =
    StateNotifierProvider.autoDispose<HomeController, HomeState>((ref) {
  return Modular.get<HomeController>();
});

class HomeState extends BaseState {
  AuthUser? authUser;
  FinanceControlMetric? financeControlMetric;

  HomeState(
      {required super.isLoading,
      required this.authUser,
      required this.financeControlMetric,
      super.error});

  factory HomeState.inital() => HomeState(
        isLoading: false,
        authUser: AuthUser(
            id: '', name: '', cpf: '', acessToken: '', roles: <String>{}),
        financeControlMetric: FinanceControlMetric(),
      );

  HomeState copyWith({
    AuthUser? authUser,
    FinanceControlMetric? financeControlMetric,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
        authUser: authUser ?? this.authUser,
        financeControlMetric: financeControlMetric ?? this.financeControlMetric,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class HomeController extends StateNotifier<HomeState> {
  FinanceControlMetricsUsecase financeControlMetricsUsecase;

  HomeController(this.financeControlMetricsUsecase) : super(HomeState.inital());

  Future<void> loadingPage() async {
    try {
      state = state.copyWith(isLoading: true);

      await _getUserLogged();
      await _getHomeMetrics();

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  _getUserLogged() async {
    try {
      var userLoggedBox = await Hive.openBox(AppKeyHive.userLogged);
      AuthUser authUser = userLoggedBox.get(AppKeyHive.getUserLogged);

      state = state.copyWith(authUser: authUser);
    } catch (e) {
      rethrow;
    }
  }

  _getHomeMetrics() async {
    try {
      await financeControlMetricsUsecase
          .call(NoParams())
          .then((value) => value.fold(
                (l) => null,
                (r) => state = state.copyWith(financeControlMetric: r),
              ));
    } catch (e) {
      rethrow;
    }
  }
}
