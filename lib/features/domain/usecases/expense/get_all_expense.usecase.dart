import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/expense.repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class GetAllExpenseUsecase extends Usecase<List<Expense>, NoParams> {
  late final ExpenseRepository repository;

  GetAllExpenseUsecase(this.repository);

  @override
  Future<Either<Failure, List<Expense>>> call(NoParams params) async {
    return await repository.getAll();
  }
}
