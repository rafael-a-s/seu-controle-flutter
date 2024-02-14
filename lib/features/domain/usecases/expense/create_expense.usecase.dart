import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/expense.repository.dart';
import 'package:dartz/dartz.dart';

class CreateExpenseUsecase implements Usecase<Expense, Expense> {
  late final ExpenseRepository repository;

  CreateExpenseUsecase(this.repository);

  @override
  Future<Either<Failure, Expense>> call(Expense expense) async {
    return await repository.create(expense);
  }
}
