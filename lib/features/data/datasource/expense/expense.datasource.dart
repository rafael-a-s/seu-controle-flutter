import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/expense/expense.model.dart';

abstract class ExpenseDatasource
    extends IBaseDatasource<ExpenseModel, dynamic> {
  ExpenseDatasource({required super.api});
}
