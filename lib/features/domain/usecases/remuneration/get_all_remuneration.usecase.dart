import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/remuneration.repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class GetAllRemunerationUsecase extends Usecase<List<Remuneration>, NoParams> {
  late final RemunerationRepository repository;

  GetAllRemunerationUsecase(this.repository);

  @override
  Future<Either<Failure, List<Remuneration>>> call(NoParams params) async {
    return await repository.getAll();
  }
}
