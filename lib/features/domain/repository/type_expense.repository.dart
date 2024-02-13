import 'package:clean_architeture_flutter/core/data/repositories/i_base.repository.dart';
import 'package:clean_architeture_flutter/features/data/model/typeExpense/type_expense.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';

abstract class TypeExpenseRepository
    extends IBaseRepository<TypeExpense, TypeExpenseModel, dynamic> {}
