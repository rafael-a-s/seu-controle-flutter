import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthUser>> singInWithGoogle();
  Future<Either<Failure, String>> logout();
}
