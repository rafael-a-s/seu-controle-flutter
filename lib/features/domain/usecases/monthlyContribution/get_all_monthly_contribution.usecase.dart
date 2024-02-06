import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/monthly_contribution.repository.dart';
import 'package:dartz/dartz.dart';

class GetAllMonthlyContributionUsecase
    extends Usecase<List<MonthlyContribution>, NoParams> {
  late final MonthlyContributionRepository repository;

  GetAllMonthlyContributionUsecase(this.repository);

  @override
  Future<Either<Failure, List<MonthlyContribution>>> call(
      NoParams params) async {
    return await repository.getAll();
  }
}
