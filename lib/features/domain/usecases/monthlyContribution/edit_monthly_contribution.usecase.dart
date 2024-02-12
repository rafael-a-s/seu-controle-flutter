import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/monthly_contribution.repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class EditMonthlyContributionUsecase
    extends Usecase<MonthlyContribution, MonthlyContribution> {
  final MonthlyContributionRepository repository;
  EditMonthlyContributionUsecase(this.repository);

  @override
  Future<Either<Failure, MonthlyContribution>> call(
      MonthlyContribution params) async {
    return await repository.update(params);
  }
}
