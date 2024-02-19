import 'package:clean_architeture_flutter/core/data/repositories/base.repository.dart';
import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/features/data/datasource/remuneration/remuneration.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/remuneration/remuneration.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/enum/type_remuneration_provider.enum.dart';
import 'package:clean_architeture_flutter/features/domain/repository/remuneration.repository.dart';

class RemunerationRepositoryImpl
    extends BaseRepository<Remuneration, RemunerationModel, dynamic>
    implements RemunerationRepository {
  final ModelConvert<Remuneration, RemunerationModel> modelConvert =
      ModelConvert(
    fromEntity: (data) => Remuneration(
      id: data.id,
      provider: data.provider,
      value: data.value,
      typeRemunerationProvider: TypeRemunerationProvider.clt,
    ),
    toModel: ((entity) => RemunerationModel(
          id: entity.id,
          provider: entity.provider,
          value: entity.value,
          typeRemunerationProvider: TypeRemunerationProvider.contract,
        )),
  );

  final RemunerationDatasource _datasource;

  RemunerationRepositoryImpl(this._datasource) : super(datasource: _datasource);

  @override
  ModelConvert<Remuneration, RemunerationModel> getModelConvert() {
    return modelConvert;
  }

  @override
  RemunerationDatasource get datasource => _datasource;
}
