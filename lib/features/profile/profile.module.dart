import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/user/user.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/user/user_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repository/user_repositorie_impl.repository.dart';
import 'package:clean_architeture_flutter/features/domain/repository/user_repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/user/get_user.usecase.dart';
import 'package:clean_architeture_flutter/features/profile/controller/profile.controller.dart';
import 'package:clean_architeture_flutter/features/start/ui/pages/profile.page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  ProfileModule();

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
    i.addSingleton<UserDatasource>(
        () => UserDatasourceImpl(client: i.get<Dio>(), api: '/user'));
    i.addSingleton<UserRepository>(UserRepositoryImpl.new);
    i.add<GetUserUsecase>(GetUserUsecase.new);
    i.add<ProfileController>(ProfileController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/:id", child: (_) => ProfilePage(id: r.args.params['id']));
  }
}
