import 'package:clean_architeture_flutter/features/remuneration/interactor/entity/remuneration.entity.dart';

sealed class RemunerationEvent {
  const RemunerationEvent();
}

class RemunerationEventGet implements RemunerationEvent{}
class RemunerationEventGetAll implements RemunerationEvent{}
class RemunerationEventCreate implements RemunerationEvent{
  final Remuneration remuneration;
  RemunerationEventCreate({required this.remuneration});
}
class RemunerationEventUpdate implements RemunerationEvent{
  final Remuneration remuneration;
  RemunerationEventUpdate({required this.remuneration});
}
class RemunerationEventDelete implements RemunerationEvent{}