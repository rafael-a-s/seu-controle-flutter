import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/features/core/models/check_box.model.dart';
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
  List<CheckBoxModel>? listaCheck;

  FormRemunerationState(
      {required super.isLoading,
      required this.remuneration,
      required this.listaCheck,
      super.error});

  factory FormRemunerationState.inital() => FormRemunerationState(
      isLoading: false,
      listaCheck: TypeRemunerationProvider.values
          .map((e) => CheckBoxModel(
              name: e.name, isSelect: e == TypeRemunerationProvider.other))
          .toList(),
      remuneration: Remuneration(
        typeRemunerationProvider: TypeRemunerationProvider.internship,
        provider: '',
        value: 0,
      ));

  FormRemunerationState copyWith({
    Remuneration? remuneration,
    List<CheckBoxModel>? listaCheck,
    bool? isLoading,
    String? error,
  }) {
    return FormRemunerationState(
        remuneration: remuneration ?? this.remuneration,
        listaCheck: listaCheck ?? this.listaCheck,
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

  checkItem(int index) {
    var list = TypeRemunerationProvider.values
        .map((e) => CheckBoxModel(name: e.name, isSelect: false))
        .toList();
    list[index].isSelect = true;

    state = state.copyWith(listaCheck: list);
  }

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
