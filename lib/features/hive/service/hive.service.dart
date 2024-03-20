import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';

abstract interface class HiveService {
  Future<void> put(AuthUser user);
  Future<void> pop();
  Future<AuthUser> getAuthUser();
}