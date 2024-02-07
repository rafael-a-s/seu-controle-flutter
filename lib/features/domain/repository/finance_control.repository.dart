import 'package:clean_architeture_flutter/core/data/repositories/i_base.repository.dart';
import 'package:clean_architeture_flutter/features/data/model/financeControl/finance_control.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control.entity.dart';

abstract class FinanceControlRepository
    extends IBaseRepository<FinanceControl, FinanceControlModel, String> {}
