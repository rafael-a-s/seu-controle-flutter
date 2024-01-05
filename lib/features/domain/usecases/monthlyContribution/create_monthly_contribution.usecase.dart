import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/monthly_contribution.repository.dart';
import 'package:dartz/dartz.dart';

class CreateMonthlyContributionUsecase
    implements Usecase<MonthlyContribution, MonthlyContribution> {
  late final MonthlyContributionRepository repository;

  CreateMonthlyContributionUsecase(this.repository);

  @override
  Future<Either<Failure, MonthlyContribution>> call(
      MonthlyContribution monthlyContribution) async {
    return await repository.create(monthlyContribution);
  }
}
