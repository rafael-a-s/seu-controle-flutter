import 'package:clean_architeture_flutter/core/data/repositories/i_base.repository.dart';
import 'package:clean_architeture_flutter/features/data/model/expense/expense.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';

abstract class ExpenseRepository
    extends IBaseRepository<Expense, ExpenseModel, dynamic> {}
