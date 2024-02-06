import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/repository/monthly_contribution.repository.dart';
import 'package:dartz/dartz.dart';

class DeleteMonthlyContributionUsecase extends Usecase<int?, String> {
  late final MonthlyContributionRepository repository;

  DeleteMonthlyContributionUsecase(this.repository);

  @override
  Future<Either<Failure, int?>> call(String params) async {
    return await repository.delete(params);
  }
}
