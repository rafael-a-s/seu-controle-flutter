import 'package:clean_architeture_flutter/features/data/datasource/auth/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/auth/auth_user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final FirebaseAuth auth;
  final GoogleAuthProvider googleAuthProvider;

  AuthDatasourceImpl(this.auth, this.googleAuthProvider);

  @override
  Future<String> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AuthUserModel> singInWithGoogle() async {
    try {
      final userCredential = await auth.signInWithProvider(googleAuthProvider);

      return AuthUserModel(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName ?? "Sem nome",
        email: userCredential.user!.email,
        photoURL: userCredential.user!.photoURL,
      );
    } on FirebaseAuthException {
      throw FirebaseAuthException(code: '401');
    }
  }
}
