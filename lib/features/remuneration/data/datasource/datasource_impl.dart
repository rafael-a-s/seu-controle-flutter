import 'package:clean_architeture_flutter/core/data/datasources/base_firebase.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/datasource/datasource.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/entity/remuneration.entity.dart';

class RemunerationDatasourceImpl
    extends BaseDatasourceFirebase<Remuneration, dynamic>
    implements RemunerationDatasource {
  RemunerationDatasourceImpl(
      {required super.client, required super.api});

  @override
  JsonModelConvert<Remuneration> getJsonConvert() {
    // TODO: implement getJsonConvert
    throw UnimplementedError();
  }


}
