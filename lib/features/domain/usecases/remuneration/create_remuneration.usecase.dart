import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/remuneration.repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class CreateRemunerationUsecase implements Usecase<Remuneration, Remuneration> {
  late final RemunerationRepository repository;

  CreateRemunerationUsecase(this.repository);

  @override
  Future<Either<Failure, Remuneration>> call(Remuneration remuneration) async {
    return await repository.create(remuneration);
  }
}
