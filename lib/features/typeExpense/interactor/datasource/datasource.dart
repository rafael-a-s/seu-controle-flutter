import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/entity/type_expense.entity.dart';

abstract class TypeExpenseDatasource
    extends IBaseDatasource<TypeExpense, dynamic> {
  TypeExpenseDatasource({required super.api});
}
