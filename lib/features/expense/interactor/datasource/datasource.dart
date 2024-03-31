import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/entity/expense.entity.dart';

abstract class ExpenseDatasource
    extends IBaseDatasource<Expense, dynamic> {
  ExpenseDatasource({required super.api});
}
