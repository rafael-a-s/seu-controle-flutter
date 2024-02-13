import 'package:clean_architeture_flutter/core/data/repositories/base.repository.dart';
import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/features/data/datasource/typeExpense/type_expense.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/typeExpense/type_expense.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/type_expense.repository.dart';

class TypeExpenseRepositoryImpl
    extends BaseRepository<TypeExpense, TypeExpenseModel, dynamic>
    implements TypeExpenseRepository {
  final ModelConvert<TypeExpense, TypeExpenseModel> modelConvert = ModelConvert(
    fromEntity: (data) => TypeExpense(
      id: data.id,
      nameOfExpense: data.nameOfExpense,
      expenses: data.expenses,
    ),
    toModel: ((entity) => TypeExpenseModel(
          id: entity.id,
          nameOfExpense: entity.nameOfExpense,
          expenses: entity.expenses,
        )),
  );

  final TypeExpenseDatasource _datasource;

  TypeExpenseRepositoryImpl(this._datasource) : super(datasource: _datasource);

  @override
  ModelConvert<TypeExpense, TypeExpenseModel> getModelConvert() {
    return modelConvert;
  }

  @override
  TypeExpenseDatasource get datasource => _datasource;
}
