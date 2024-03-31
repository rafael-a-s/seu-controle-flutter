import 'package:clean_architeture_flutter/core/data/datasources/base_firebase.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/datasource/datasource.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/entity/type_expense.entity.dart';

class TypeExpenseDatasourceImpl
    extends BaseDatasourceFirebase<TypeExpense, dynamic>
    implements TypeExpenseDatasource {
  TypeExpenseDatasourceImpl(
      {required super.client, required super.api});

  @override
  JsonModelConvert<TypeExpense> getJsonConvert() {
    // TODO: implement getJsonConvert
    throw UnimplementedError();
  }


}
