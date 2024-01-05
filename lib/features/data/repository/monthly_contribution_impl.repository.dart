import 'package:clean_architeture_flutter/core/data/repositories/base.repository.dart';
import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/features/data/datasource/monthlyContribution/monthly_contribution.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/monthlyContribution/monthly_contribution.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/monthly_contribution.repository.dart';

class MonthlyContributionRepositoryImpl extends BaseRepository<
    MonthlyContribution,
    MonthlyContributionModel,
    dynamic> implements MonthlyContributionRepository {
  final ModelConvert<MonthlyContribution, MonthlyContributionModel>
      modelConvert = ModelConvert(
    fromEntity: (data) => MonthlyContribution(
      id: data.id,
      nameInvestiment: data.nameInvestiment,
      value: data.value,
    ),
    toModel: ((entity) => MonthlyContributionModel(
          id: entity.id,
          nameInvestiment: entity.nameInvestiment,
          value: entity.value,
        )),
  );

  final MonthlyContributionDatasource _datasource;

  MonthlyContributionRepositoryImpl(this._datasource)
      : super(datasource: _datasource);

  @override
  ModelConvert<MonthlyContribution, MonthlyContributionModel>
      getModelConvert() {
    return modelConvert;
  }

  @override
  MonthlyContributionDatasource get datasource => _datasource;
}
