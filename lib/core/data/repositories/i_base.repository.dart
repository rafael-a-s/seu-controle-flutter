import 'package:dartz/dartz.dart';
import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/core/erros/failures.dart';

abstract class IBaseRepository<T extends BaseEntity, M extends BaseEntity, ID> {
  Future<Either<Failure, List<T>>> getAll();
  Future<Either<Failure, T>> get(ID id);
  Future<Either<Failure, T>> create(T t);
  Future<Either<Failure, T>> update(T t);
  Future<Either<Failure, int?>> delete(ID id);
  ModelConvert<T, M> getModelConvert();
}
