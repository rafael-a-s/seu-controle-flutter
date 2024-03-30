import 'package:clean_architeture_flutter/features/user/interactor/entity/user.entity.dart';

sealed class UserEvent {
  const UserEvent();
}

class ValideUserAfterLoginUserEvent extends UserEvent {}

class CreateUserEvent extends UserEvent {
  final UserFirebase userFirebase;

  const CreateUserEvent({required this.userFirebase});
}
