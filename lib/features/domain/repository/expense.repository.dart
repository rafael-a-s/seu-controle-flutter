import 'package:clean_architeture_flutter/core/data/repositories/i_base.repository.dart';
import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/features/data/model/expense/expense.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

abstract class ExpenseRepository
    extends IBaseRepository<Expense, ExpenseModel, dynamic> {
      Future<Either<Failure, List<Expense>>> getAllOfTypeExpense(String idTypeExpense);
    }
