import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/monthlyContribution/pages/monthly_contribution.page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MonthlyContribution extends Module {
  MonthlyContribution();

  @override
  void binds(Injector i) {
    i.addSingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: AppRoutesApi.baseUrl,
          connectTimeout: 20000,
          receiveTimeout: 20000,
        ),
      ),
      config: BindConfig(
        onDispose: (dio) => dio.close(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const MonthlyContributionPage());
  }
}
