import 'package:clean_architeture_flutter/features/auth/auth.module.dart';
import 'package:clean_architeture_flutter/features/remuneration/data/adapters/adapter.dart';
import 'package:clean_architeture_flutter/features/remuneration/data/datasource/datasource_impl.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/blocs/bloc.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/datasource/datasource.dart';
import 'package:clean_architeture_flutter/features/remuneration/ui/pages/view.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interactor/entity/remuneration.entity.dart';

class RemunerationModule extends Module {
  RemunerationModule();

  @override
  // TODO: implement imports
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<RemunerationDatasource>(() =>
        RemunerationDatasourceImpl(
            client: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('remuneration')
                .withConverter<Remuneration>(
                  fromFirestore: (snapshot, _) => RemunerationAdapter.fromJson(snapshot.data()!, snapshot.id),
                  toFirestore: (model, _) => RemunerationAdapter.toJson(model),
                ),
            api: ''));
    i.addSingleton<MonthlyContributinoBloc>(() => MonthlyContributinoBloc(
        datasource: i.get<RemunerationDatasource>()));
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const RemunerationPage());
  }
}
