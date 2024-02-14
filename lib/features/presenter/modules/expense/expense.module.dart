import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/expense/expense.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/expense/expense_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repository/expense_impl.repository.dart';
import 'package:clean_architeture_flutter/features/domain/repository/expense.repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/expense/create_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/expense/delete_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/expense/edit_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/expense/get_all_expense.usecase.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/expense/controller/expense.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/expense/controller/form_expense.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/expense/pages/expense.page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExpenseModule extends Module {
  ExpenseModule();

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
    i.addSingleton<ExpenseDatasource>(
        () => ExpenseDatasourceImpl(client: i.get<Dio>(), api: '/expense'));
    i.addSingleton<ExpenseRepository>(ExpenseRepositoryImpl.new);
    i.add<CreateExpenseUsecase>(CreateExpenseUsecase.new);
    i.add<GetAllExpenseUsecase>(GetAllExpenseUsecase.new);
    i.add<DeleteExpenseUsecase>(DeleteExpenseUsecase.new);
    i.add<EditExpenseUsecase>(EditExpenseUsecase.new);
    i.add<FormExpenseController>(FormExpenseController.new);
    i.add<ExpenseController>(ExpenseController.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => ExpensePage(typeExpense: r.args.data));
  }
}
