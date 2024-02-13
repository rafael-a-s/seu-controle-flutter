import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/typeExpense/type_expense.model.dart';

abstract class TypeExpenseDatasource
    extends IBaseDatasource<TypeExpenseModel, dynamic> {
  TypeExpenseDatasource({required super.api});
}
