import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/entity/remuneration.entity.dart';

abstract class RemunerationDatasource
    extends IBaseDatasource<Remuneration, dynamic> {
  RemunerationDatasource({required super.api});
}
