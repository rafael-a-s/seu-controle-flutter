import 'package:clean_architeture_flutter/core/data/repositories/i_base.repository.dart';
import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/features/data/model/financeControl/finance_control.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control_metric.entity.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

abstract class FinanceControlRepository
    extends IBaseRepository<FinanceControl, FinanceControlModel, String> {
  Future<Either<Failure, FinanceControlMetric>> financeControlMetrics();
}
