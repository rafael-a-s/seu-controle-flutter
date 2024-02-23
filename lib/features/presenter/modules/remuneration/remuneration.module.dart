import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/remuneration/remuneration.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/remuneration/remuneration_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repository/remuneration_impl.repository.dart';
import 'package:clean_architeture_flutter/features/domain/repository/remuneration.repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/remuneration/create_remuneration.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/remuneration/delete_remuneration.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/remuneration/edit_remuneration.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/remuneration/get_all_remuneration.usecase.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/remuneration/controller/form_remuneration.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/remuneration/controller/remuneration.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/remuneration/pages/remuneration.page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RemunerationModule extends Module {
  RemunerationModule();

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
    i.addSingleton<RemunerationDatasource>(() =>
        RemunerationDatasourceImpl(client: i.get<Dio>(), api: '/remuneration'));
    i.addSingleton<RemunerationRepository>(RemunerationRepositoryImpl.new);
    i.add<CreateRemunerationUsecase>(CreateRemunerationUsecase.new);
    i.add<GetAllRemunerationUsecase>(GetAllRemunerationUsecase.new);
    i.add<DeleteRemunerationUsecase>(DeleteRemunerationUsecase.new);
    i.add<EditRemunerationUsecase>(EditRemunerationUsecase.new);
    i.add<FormRemunerationController>(FormRemunerationController.new);
    i.add<RemunerationController>(RemunerationController.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const RemunerationPage());
  }
}
