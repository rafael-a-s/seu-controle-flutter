import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control_metric.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/finance_control.repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class FinanceControlMetricsUsecase
    extends Usecase<FinanceControlMetric, NoParams> {
  final FinanceControlRepository repository;

  FinanceControlMetricsUsecase(this.repository);

  @override
  Future<Either<Failure, FinanceControlMetric>> call(NoParams params) async {
    return repository.financeControlMetrics();
  }
}
