import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/type_expense.repository.dart';
import 'package:dartz/dartz.dart';

class CreateTypeExpenseUsecase implements Usecase<TypeExpense, TypeExpense> {
  late final TypeExpenseRepository repository;

  CreateTypeExpenseUsecase(this.repository);

  @override
  Future<Either<Failure, TypeExpense>> call(TypeExpense typeExpense) async {
    return await repository.create(typeExpense);
  }
}
