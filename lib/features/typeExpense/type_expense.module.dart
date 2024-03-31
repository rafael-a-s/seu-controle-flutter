import 'package:clean_architeture_flutter/features/auth/auth.module.dart';
import 'package:clean_architeture_flutter/features/typeExpense/data/adapters/adapter.dart';
import 'package:clean_architeture_flutter/features/typeExpense/data/datasource/datasource_impl.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/blocs/bloc.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/datasource/datasource.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/entity/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/typeExpense/ui/pages/view.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TypeExpenseModule extends Module {
  TypeExpenseModule();

  @override
  // TODO: implement imports
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<TypeExpenseDatasource>(() =>
        TypeExpenseDatasourceImpl(
            client: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('typeExpense')
                .withConverter<TypeExpense>(
                  fromFirestore: (snapshot, _) => TypeExpenseAdapter.fromJson(snapshot.data()!, snapshot.id),
                  toFirestore: (model, _) => TypeExpenseAdapter.toJson(model),
                ),
            api: ''));
    i.addSingleton<TypeExpenseBloc>(() => TypeExpenseBloc(
        datasource: i.get<TypeExpenseDatasource>()));
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const TypeExpensePage());
  }
}
