import 'package:clean_architeture_flutter/core/data/repositories/base.repository.dart';
import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/features/data/model/financeControl/finance_control.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repository/finance_control.repository.dart';

class FinanceControlRepositoryImpl
    extends BaseRepository<FinanceControl, FinanceControlModel, String>
    implements FinanceControlRepository {
  final ModelConvert<FinanceControl, FinanceControlModel> convert =
      ModelConvert(
    fromEntity: (data) => FinanceControl(
      id: data.id,
      expensesFixes: data.expensesFixes
          .map((e) => Expense(
                name: e.name,
                dayDiscount: e.dayDiscount,
                value: e.value,
              ))
          .toList(),
      monthlyContributions: data.monthlyContributions
          .map((e) => MonthlyContribution(
                nameInvestiment: e.nameInvestiment,
                value: e.value,
              ))
          .toList(),
      remunerations: data.remunerations
          .map((e) => Remuneration(
                provider: e.provider,
                value: e.value,
                typeRemunerationProvider: e.typeRemunerationProvider,
              ))
          .toList(),
    ),
    toModel: (entity) => entity as FinanceControlModel,
  );

  FinanceControlRepositoryImpl({required super.datasource});

  @override
  ModelConvert<FinanceControl, FinanceControlModel> getModelConvert() {
    return convert;
  }
}
