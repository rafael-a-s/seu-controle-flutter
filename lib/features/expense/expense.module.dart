import 'package:clean_architeture_flutter/features/auth/auth.module.dart';
import 'package:clean_architeture_flutter/features/expense/data/adapters/adapter.dart';
import 'package:clean_architeture_flutter/features/expense/data/datasource/datasource_impl.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/blocs/bloc.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/datasource/datasource.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/entity/expense.entity.dart';
import 'package:clean_architeture_flutter/features/expense/ui/pages/view.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';


class ExpenseModule extends Module {
  final String typeExpenseUid;

  ExpenseModule({required this.typeExpenseUid});

  @override
  // TODO: implement imports
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<ExpenseDatasource>(() =>
        ExpenseDatasourceImpl(
            client: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('typeExpense')
                .doc(typeExpenseUid)
                .collection('expense')
                .withConverter<Expense>(
                  fromFirestore: (snapshot, _) => ExpenseAdapter.fromJson(snapshot.data()!, snapshot.id),
                  toFirestore: (model, _) => ExpenseAdapter.toJson(model),
                ),
            api: ''));
    i.addSingleton<ExpenseBloc>(() => ExpenseBloc(
        datasource: i.get<ExpenseDatasource>()));
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const ExpensePage());
  }
}
