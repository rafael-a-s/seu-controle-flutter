import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/core/erros/exceptions.dart';
import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/features/data/datasource/auth/auth.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/auth/auth_user.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:clean_architeture_flutter/features/domain/repository/auth_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ModelConvert<AuthUser, AuthUserModel> modelConvert = ModelConvert(
    fromEntity: (data) => AuthUser(
      uid: data.uid,
      name: data.name,
      email: data.email,
      photoURL: data.photoURL,
    ),
    toModel: ((entity) => AuthUserModel(
          uid: entity.uid,
          name: entity.name,
          email: entity.email,
          photoURL: entity.photoURL,
        )),
  );

  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, AuthUser>> singInWithGoogle() async {
    try {
      AuthUserModel authUser = await datasource.singInWithGoogle();
      AuthUser authUserEntity = modelConvert.fromEntity(authUser);

      return Right(authUserEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  AuthDatasource get datasource => _datasource;

  @override
  Future<Either<Failure, String>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
