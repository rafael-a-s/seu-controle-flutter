import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:clean_architeture_flutter/features/user/data/adapters/user.adapter.dart';
import 'package:clean_architeture_flutter/features/user/data/datasource/user_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/user/interactor/blocs/user.bloc.dart';
import 'package:clean_architeture_flutter/features/user/interactor/datasource/user.datasource.dart';
import 'package:clean_architeture_flutter/features/user/interactor/entity/user.entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends Module {
  UserModule();

  @override
  void binds(Injector i) {
    i.add<UserDatasource>(() => UserDatasourceImpl(
          firestore:
              FirebaseFirestore.instance.collection('user').withConverter<UserFirebase>(
                    fromFirestore: (snapshot, _) => UserAdapter.fromFirebaseUser(snapshot.data()!, snapshot.id),
                    toFirestore: (model, _) => UserAdapter.toFirebase(model),
                  ),
        ));
    i.addSingleton<UserBloc>(
        () => UserBloc(i.get<UserDatasource>(), i.get<HiveService>()));
  }
}
