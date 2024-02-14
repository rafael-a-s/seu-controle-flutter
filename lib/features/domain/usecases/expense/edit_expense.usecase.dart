import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/expense.repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class EditExpenseUsecase extends Usecase<Expense, Expense> {
  final ExpenseRepository repository;
  EditExpenseUsecase(this.repository);

  @override
  Future<Either<Failure, Expense>> call(Expense params) async {
    return await repository.update(params);
  }
}
