import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/data/datasource/financeControl/finance_control.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/financeControl/finance_control_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repository/finance_control.repository_impl.dart';
import 'package:clean_architeture_flutter/features/domain/repository/finance_control.repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/financeControl/finance_control_metrics.usecase.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/submodule/financeControl/submodule/expense/expense.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/submodule/financeControl/submodule/monthlyContribution/monthly_contribution.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/submodule/financeControl/submodule/remuneration/remuneration.module.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/submodule/financeControl/submodule/typeExpense/type_expense.module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinanceControlModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<Dio>(
      () {
        return Dio(BaseOptions(
          baseUrl: AppRoutesApi.baseUrl,
          connectTimeout: 20000,
          receiveTimeout: 20000,
        ));
      },
      config: BindConfig(
        onDispose: (dio) => dio.close(),
      ),
    );
    i.addSingleton<FinanceControlDatasource>(() => FinanceControlDatasourceImpl(
        client: i.get<Dio>(), api: '/finance-control'));
    i.addSingleton<FinanceControlRepository>(FinanceControlRepositoryImpl.new);
    i.add<FinanceControlMetricsUsecase>(FinanceControlMetricsUsecase.new);
  }

  @override
  void routes(RouteManager r) {
    r.module(AppRoutes.remuneration, module: RemunerationModule());
    r.module(AppRoutes.monthlyContribution,
        module: MonthlyContributionModule());
    r.module(AppRoutes.typeExpense, module: TypeExpenseModule());
    r.module(AppRoutes.expense, module: ExpenseModule());
  }
}
