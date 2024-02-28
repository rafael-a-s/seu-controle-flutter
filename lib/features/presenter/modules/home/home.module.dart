import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/financeControl/finance_control.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/financeControl/finance_control_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repository/finance_control.repository_impl.dart';
import 'package:clean_architeture_flutter/features/domain/repository/finance_control.repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/financeControl/finance_control_metrics.usecase.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/controller/home.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/pages/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
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
    i.add<HomeController>(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const HomePage());
  }
}
