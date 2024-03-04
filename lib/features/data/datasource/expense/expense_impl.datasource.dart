import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/expense/expense.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/expense/expense.model.dart';
import 'package:dio/dio.dart';

class ExpenseDatasourceImpl extends BaseDatasource<ExpenseModel, dynamic>
    implements ExpenseDatasource {
  final JsonModelConvert<ExpenseModel> jsonModelConvert = JsonModelConvert(
    fromJson: (data) => ExpenseModel.fromJson(data),
    toJson: (data) => data.toJson(),
  );

  ExpenseDatasourceImpl({required super.client, required super.api});

  @override
  Future<List<ExpenseModel>> getAllOfTypeExpense(String idTypeExpense) async {
    try {
      var response = await client
          .get("${AppRoutesApi.expenseGetAllOfTypeExpense}/$idTypeExpense");
      var data = response.data as List;
      final convert = getJsonConvert();
      return data.map((e) => convert.fromJson(e)).toList();
    } on DioError catch (e) {
      throw DioError(requestOptions: RequestOptions(path: ''), error: e.error);
    }
  }

  @override
  JsonModelConvert<ExpenseModel> getJsonConvert() {
    return jsonModelConvert;
  }
}
