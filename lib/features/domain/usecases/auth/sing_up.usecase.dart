import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/data/model/user/user_sing_up.model.dart';
import 'package:clean_architeture_flutter/features/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SingUpUsecase extends Usecase<String, Map<String, dynamic>> {
  late final AuthRepository authRepository;

  SingUpUsecase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(Map<String, dynamic> params) async {
    return await authRepository.singUp(UserSingUpModel.fromModel(params));
  }
}
