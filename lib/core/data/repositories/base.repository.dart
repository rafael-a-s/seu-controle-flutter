import 'package:dartz/dartz.dart';
import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/core/erros/exceptions.dart';
import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/core/data/repositories/i_base.repository.dart';
import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/core/erros/failures.dart';

abstract class BaseRepository<T extends BaseEntity, M extends BaseEntity, ID>
    extends IBaseRepository<T, M, ID> {
  late final IBaseDatasource datasource;

  BaseRepository({required this.datasource});

  @override
  Future<Either<Failure, List<T>>> getAll() async {
    try {
      final result = await datasource.getAll();
      final ModelConvert<T, M> convert = getModelConvert();
      return Right(
          result.map((value) => convert.fromEntity(value as M)).toList());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, T>> get(ID id) async {
    try {
      final result = await datasource.get(id);
      final ModelConvert<T, M> convert = getModelConvert();
      return Right(convert.fromEntity(result as M));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, T>> create(T t) async {
    try {
      final ModelConvert<T, M> convert = getModelConvert();
      final result = await datasource.create(convert.toModel(t));
      return Right(convert.fromEntity(result as M));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, T>> update(T t) async {
    try {
      final ModelConvert<T, M> convert = getModelConvert();
      final result = await datasource.update(convert.toModel(t));
      return Right(convert.fromEntity(result as M));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int?>> delete(ID id) async {
    try {
      final statusCodeNoContent = await datasource.delete(id);
      return Right(statusCodeNoContent);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
