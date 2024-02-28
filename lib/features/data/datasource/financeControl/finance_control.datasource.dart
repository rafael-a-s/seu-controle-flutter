import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/financeControl/finance_control_metric.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control.entity.dart';

abstract class FinanceControlDatasource
    implements IBaseDatasource<FinanceControl, String> {
  Future<FinanceControlMetricModel> financeControlMetrics();
}
