import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/typeExpense/type_expense.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/typeExpense/type_expense_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repository/type_expense_impl.repository.dart';
import 'package:clean_architeture_flutter/features/domain/repository/type_expense.repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/typeExpense/create_type_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/typeExpense/delete_type_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/typeExpense/edit_type_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/typeExpense/get_all_type_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/start/submodule/financeControl/submodule/typeExpense/controller/form_type_expense.controller.dart';
import 'package:clean_architeture_flutter/features/start/submodule/financeControl/submodule/typeExpense/controller/type_expense.controller.dart';
import 'package:clean_architeture_flutter/features/start/submodule/financeControl/submodule/typeExpense/pages/type_expense.page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TypeExpenseModule extends Module {
  TypeExpenseModule();

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
    i.addSingleton<TypeExpenseDatasource>(() =>
        TypeExpenseDatasourceImpl(client: i.get<Dio>(), api: '/type-expense'));
    i.addSingleton<TypeExpenseRepository>(TypeExpenseRepositoryImpl.new);
    i.add<CreateTypeExpenseUsecase>(CreateTypeExpenseUsecase.new);
    i.add<GetAllTypeExpenseUsecase>(GetAllTypeExpenseUsecase.new);
    i.add<DeleteTypeExpenseUsecase>(DeleteTypeExpenseUsecase.new);
    i.add<EditTypeExpenseUsecase>(EditTypeExpenseUsecase.new);
    i.add<FormTypeExpenseController>(FormTypeExpenseController.new);
    i.add<TypeExpenseController>(TypeExpenseController.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const TypeExpensePage());
  }
}
