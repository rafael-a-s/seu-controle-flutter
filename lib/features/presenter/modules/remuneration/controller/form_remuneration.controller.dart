import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/enum/type_remuneration_provider.enum.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/remuneration/create_remuneration.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/remuneration/edit_remuneration.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final formRemunerationStateProvider = StateNotifierProvider.autoDispose<
    FormRemunerationController, FormRemunerationState>((ref) {
  return Modular.get<FormRemunerationController>();
});

class FormRemunerationState extends BaseState {
  Remuneration? remuneration;

  FormRemunerationState(
      {required super.isLoading, required this.remuneration, super.error});

  factory FormRemunerationState.inital() => FormRemunerationState(
      isLoading: false,
      remuneration: Remuneration(
        typeRemunerationProvider: TypeRemunerationProvider.internship,
        provider: '',
        value: 0,
      ));

  FormRemunerationState copyWith({
    Remuneration? remuneration,
    bool? isLoading,
    String? error,
  }) {
    return FormRemunerationState(
        remuneration: remuneration ?? this.remuneration,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class FormRemunerationController extends StateNotifier<FormRemunerationState> {
  CreateRemunerationUsecase createRemunerationUsecase;
  EditRemunerationUsecase editRemunerationUsecase;

  FormRemunerationController(
      this.createRemunerationUsecase, this.editRemunerationUsecase)
      : super(FormRemunerationState.inital());

  Future<void> createRemuneration(Remuneration remuneration) async {
    try {
      state = state.copyWith(isLoading: true);

      await createRemunerationUsecase(remuneration).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(remuneration: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> editRemuneration(Remuneration remuneration) async {
    try {
      state = state.copyWith(isLoading: true);

      await editRemunerationUsecase(remuneration).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(remuneration: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
