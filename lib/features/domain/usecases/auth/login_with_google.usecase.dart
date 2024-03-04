import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:clean_architeture_flutter/features/domain/repository/auth_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class LoginWithGoogleUsecase extends Usecase<AuthUser, NoParams> {
  late final AuthRepository authRepository;

  LoginWithGoogleUsecase(this.authRepository);

  @override
  Future<Either<Failure, AuthUser>> call(NoParams) async {
    return await authRepository.singInWithGoogle();
  }
}
