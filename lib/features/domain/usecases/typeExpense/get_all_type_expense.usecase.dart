import 'package:clean_architeture_flutter/core/erros/failures.dart';
import 'package:clean_architeture_flutter/core/usecase/usecase.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/type_expense.repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

class GetAllTypeExpenseUsecase extends Usecase<List<TypeExpense>, NoParams> {
  late final TypeExpenseRepository repository;

  GetAllTypeExpenseUsecase(this.repository);

  @override
  Future<Either<Failure, List<TypeExpense>>> call(NoParams params) async {
    return await repository.getAll();
  }
}
