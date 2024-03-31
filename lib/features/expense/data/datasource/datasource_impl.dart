import 'package:clean_architeture_flutter/core/data/datasources/base_firebase.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/datasource/datasource.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/entity/expense.entity.dart';

class ExpenseDatasourceImpl
    extends BaseDatasourceFirebase<Expense, dynamic>
    implements ExpenseDatasource {
  ExpenseDatasourceImpl(
      {required super.client, required super.api});


  @override
  JsonModelConvert<Expense> getJsonConvert() {
    // TODO: implement getJsonConvert
    throw UnimplementedError();
  }


}
