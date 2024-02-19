import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/repository/remuneration.repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class DeleteRemunerationUsecase extends Usecase<int?, String> {
  late final RemunerationRepository repository;

  DeleteRemunerationUsecase(this.repository);

  @override
  Future<Either<Failure, int?>> call(String params) async {
    return await repository.delete(params);
  }
}
