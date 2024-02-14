import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/repository/expense.repository.dart';
import 'package:dartz/dartz.dart';

class DeleteExpenseUsecase extends Usecase<int?, String> {
  late final ExpenseRepository repository;

  DeleteExpenseUsecase(this.repository);

  @override
  Future<Either<Failure, int?>> call(String params) async {
    return await repository.delete(params);
  }
}
