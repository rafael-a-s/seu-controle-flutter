import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_modular/flutter_modular.dart';

final appWidgetControllerProvider =
    StateNotifierProvider.autoDispose<AppWidgetController, AppWidgetState>(
        (ref) {
  return Modular.get<AppWidgetController>();
});

class AppWidgetState extends BaseState {
  final ThemeMode themeMode;

  AppWidgetState({
    required this.themeMode,
    required super.isLoading,
  });

  factory AppWidgetState.initial() =>
      AppWidgetState(themeMode: ThemeMode.system, isLoading: false);

  AppWidgetState copyWith({
    ThemeMode? themeMode,
    bool? isLoading,
    String? error,
  }) {
    return AppWidgetState(
      themeMode: themeMode ?? this.themeMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AppWidgetController extends StateNotifier<AppWidgetState> {
  AppWidgetController() : super(AppWidgetState.initial());

  changeTheme() {
    state = state.copyWith(
        themeMode: state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light);
  }
}
