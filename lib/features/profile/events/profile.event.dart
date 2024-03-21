import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';

sealed class ProfileEvent {
  const ProfileEvent();
}

class ProfileEventGettedUser implements ProfileEvent {
  final AuthUser authUser;

  const ProfileEventGettedUser({required this.authUser});
}