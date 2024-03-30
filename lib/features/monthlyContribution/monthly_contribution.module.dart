import 'package:clean_architeture_flutter/features/auth/auth.module.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/data/adapters/monthly_contribution.adapter.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/data/datasource/monthly_contribution_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/blocs/monthly_contribution.bloc.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/datasource/monthly_contribution.datasource.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/ui/pages/monthly_contribution.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interactor/entity/monthly_contribution.entity.dart';

class MonthlyContributionModule extends Module {
  MonthlyContributionModule();

  @override
  // TODO: implement imports
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<MonthlyContributionDatasource>(() =>
        MonthlyContributionDatasourceImpl(
            client: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('monthlyContribution')
                .withConverter<MonthlyContribution>(
                  fromFirestore: (snapshot, _) => MonthlyContributionAdapter.fromJson(snapshot.data()!, snapshot.id),
                  toFirestore: (model, _) => MonthlyContributionAdapter.toJson(model),
                ),
            api: 'monthly-contribution'));
    i.addSingleton<MonthlyContributinoBloc>(() => MonthlyContributinoBloc(
        datasource: i.get<MonthlyContributionDatasource>()));
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const MonthlyContributionPage());
  }
}
