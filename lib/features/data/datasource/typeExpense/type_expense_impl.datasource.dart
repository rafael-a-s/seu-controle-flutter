import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/data/datasource/typeExpense/type_expense.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/typeExpense/type_expense.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth/auth_user.dart';
import 'package:hive/hive.dart';

class TypeExpenseDatasourceImpl
    extends BaseDatasource<TypeExpenseModel, dynamic>
    implements TypeExpenseDatasource {
  final JsonModelConvert<TypeExpenseModel> jsonModelConvert = JsonModelConvert(
    fromJson: (data) => TypeExpenseModel.fromJson(data),
    toJson: (data) => data.toJson(),
  );

  void configureDio() async {
    var box = await Hive.openBox(AppKeyHive.userLogged);
    AuthUser token = box.get(AppKeyHive.getUserLogged);

    client.options.headers.addAll({
      "Authorization": "Bearer ${token.acessToken}",
    });
  }

  TypeExpenseDatasourceImpl({required super.client, required super.api}) {
    configureDio();
  }

  @override
  JsonModelConvert<TypeExpenseModel> getJsonConvert() {
    return jsonModelConvert;
  }
}
