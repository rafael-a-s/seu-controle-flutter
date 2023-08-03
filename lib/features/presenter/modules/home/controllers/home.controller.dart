import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_modular/flutter_modular.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, HomeState>((ref) {
  return Modular.get<HomeController>();
});

class HomeState extends BaseState<HomeState> {
  HomeState({
    required isLoading,
    String? error,
  }) : super(isLoading: isLoading, error: error);

  factory HomeState.initial() => HomeState(isLoading: false);

  HomeState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.initial());
}
