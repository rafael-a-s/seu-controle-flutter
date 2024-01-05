import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/user/user.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserUsecase implements Usecase<User, String> {
  late final UserRepository repositorie;

  GetUserUsecase(this.repositorie);

  @override
  Future<Either<Failure, User>> call(String id) async {
    return id.isNotEmpty ? await repositorie.get(id) : Left(NullParamFailure());
  }
}
