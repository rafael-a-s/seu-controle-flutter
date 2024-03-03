import 'package:clean_architeture_flutter/core/state/base_state.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/remuneration/delete_remuneration.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/remuneration/get_all_remuneration.usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final remunerationStateProvider = StateNotifierProvider.autoDispose<
    RemunerationController, RemunerationState>((ref) {
  return Modular.get<RemunerationController>();
});

class RemunerationState extends BaseState {
  List<Remuneration>? remunerations;

  RemunerationState({
    required super.isLoading,
    required this.remunerations,
    super.error,
  });

  factory RemunerationState.inital() => RemunerationState(
        isLoading: false,
        remunerations: <Remuneration>[],
      );

  RemunerationState copyWith({
    List<Remuneration>? remunerations,
    bool? isLoading,
    String? error,
  }) {
    return RemunerationState(
      remunerations: remunerations ?? this.remunerations,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class RemunerationController extends StateNotifier<RemunerationState> {
  GetAllRemunerationUsecase getAllRemunerationUsecase;
  DeleteRemunerationUsecase deleteRemunerationUsecase;

  RemunerationController(
    this.getAllRemunerationUsecase,
    this.deleteRemunerationUsecase,
  ) : super(RemunerationState.inital());

  Future<void> getAllRemuneration() async {
    try {
      state = state.copyWith(isLoading: true);

      await getAllRemunerationUsecase(NoParams()).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(remunerations: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> deleteRemuneration(String id) async {
    try {
      state = state.copyWith(isLoading: true);

      await deleteRemunerationUsecase(id);

      await getAllRemunerationUsecase(NoParams()).then(
        (value) => value.fold(
          (l) => state = state.copyWith(error: l.toString()),
          (r) => state = state.copyWith(remunerations: r),
        ),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
