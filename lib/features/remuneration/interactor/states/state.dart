import 'package:clean_architeture_flutter/features/remuneration/interactor/entity/remuneration.entity.dart';

sealed class RemunerationState {
  const RemunerationState();
}

class RemunerationStateLoading implements RemunerationState {}

class RemunerationStateEmpty implements RemunerationState {}

class RemunerationStateGetted implements RemunerationState {
  final List<Remuneration> list;

  const RemunerationStateGetted({required this.list});
}
class RemunerationStateError implements RemunerationState {
  final String error;

  const RemunerationStateError({required this.error});
}