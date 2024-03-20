import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';

sealed class HiveEvent {
  const HiveEvent();
}

class HiveEventPutUser extends HiveEvent {
  final AuthUser user;

 const HiveEventPutUser({required this.user});
}

class HiveEventPopUser extends HiveEvent {}