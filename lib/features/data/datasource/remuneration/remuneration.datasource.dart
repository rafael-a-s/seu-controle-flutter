import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/remuneration/remuneration.model.dart';

abstract class RemunerationDatasource
    extends IBaseDatasource<RemunerationModel, dynamic> {
  RemunerationDatasource({required super.api});
}
