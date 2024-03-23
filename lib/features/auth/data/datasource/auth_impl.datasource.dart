import 'package:clean_architeture_flutter/features/auth/data/adapters/user.adapter.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/datasource/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/states/auth_login.state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final FirebaseAuth auth;
  final GoogleAuthProvider googleAuthProvider;

  AuthDatasourceImpl(this.auth, this.googleAuthProvider);

  @override
  AuthState getUser() {
    try {
      final authUser = AuthAdapter.fromFirebaseUser(auth.currentUser!);
      return AuthStateGetCurrentUser(authUser);
    } catch (e) {
      return AuthStateError("Sua sessão foi comprometida");
    }
  }

  @override
  Future<AuthState> login() async {
    try {
      final userCredential = await auth.signInWithProvider(googleAuthProvider);
      final user = AuthAdapter.fromFirebaseUser(userCredential.user!);
      return AuthStateSucess(user);
    } catch (e) {
      return const AuthStateLogout();
    }
  }

  @override
  Future<AuthState> logout() async {
    try {
      await auth.signOut();
      return const AuthStateLogout();
    } catch (e) {
      return const AuthStateLogout();
    }
  }
}
