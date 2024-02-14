import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/data/datasource/expense/expense.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/expense/expense.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:hive/hive.dart';

class ExpenseDatasourceImpl extends BaseDatasource<ExpenseModel, dynamic>
    implements ExpenseDatasource {
  final JsonModelConvert<ExpenseModel> jsonModelConvert = JsonModelConvert(
    fromJson: (data) => ExpenseModel.fromJson(data),
    toJson: (data) => data.toJson(),
  );

  void configureDio() async {
    var box = await Hive.openBox(AppKeyHive.userLogged);
    AuthUser token = box.get(AppKeyHive.getUserLogged);

    client.options.headers.addAll({
      "Authorization": "Bearer ${token.acessToken}",
    });
  }

  ExpenseDatasourceImpl({required super.client, required super.api}) {
    configureDio();
  }

  @override
  JsonModelConvert<ExpenseModel> getJsonConvert() {
    return jsonModelConvert;
  }
}
