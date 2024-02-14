import 'package:clean_architeture_flutter/core/data/repositories/base.repository.dart';
import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/features/data/datasource/expense/expense.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/expense/expense.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/expense.repository.dart';

class ExpenseRepositoryImpl
    extends BaseRepository<Expense, ExpenseModel, dynamic>
    implements ExpenseRepository {
  final ModelConvert<Expense, ExpenseModel> modelConvert = ModelConvert(
    fromEntity: (data) => Expense(
        id: data.id,
        name: data.name,
        value: data.value,
        dayDiscount: data.dayDiscount,
        typeExpense: data.typeExpense),
    toModel: ((entity) => ExpenseModel(
        id: entity.id,
        name: entity.name,
        value: entity.value,
        dayDiscount: entity.dayDiscount,
        typeExpense: entity.typeExpense)),
  );

  final ExpenseDatasource _datasource;

  ExpenseRepositoryImpl(this._datasource) : super(datasource: _datasource);

  @override
  ModelConvert<Expense, ExpenseModel> getModelConvert() {
    return modelConvert;
  }

  @override
  ExpenseDatasource get datasource => _datasource;
}
