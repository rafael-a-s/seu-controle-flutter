import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthAdapter {
  static AuthUser fromFirebaseUser(User user) {
    return AuthUser(
      uid: user.uid,
      email: user.email ?? 'Sem nome',
      name: user.displayName ?? '',
      photoURL: user.photoURL ?? '',
    );
  }
}