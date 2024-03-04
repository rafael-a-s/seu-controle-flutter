import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/data/datasource/typeExpense/type_expense.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/typeExpense/type_expense.model.dart';

class TypeExpenseDatasourceImpl
    extends BaseDatasource<TypeExpenseModel, dynamic>
    implements TypeExpenseDatasource {
  final JsonModelConvert<TypeExpenseModel> jsonModelConvert = JsonModelConvert(
    fromJson: (data) => TypeExpenseModel.fromJson(data),
    toJson: (data) => data.toJson(),
  );

  TypeExpenseDatasourceImpl({required super.client, required super.api});

  @override
  JsonModelConvert<TypeExpenseModel> getJsonConvert() {
    return jsonModelConvert;
  }
}
