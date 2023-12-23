import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/user/user.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class CreateUserUsecase implements Usecase<User, User> {
  late final UserRepository repositorie;

  CreateUserUsecase(this.repositorie);

  @override
  Future<Either<Failure, User>> call(User user) async {
    return user.props.isNotEmpty
        ? await repositorie.create(user)
        : Left(NullParamFailure());
  }
}
