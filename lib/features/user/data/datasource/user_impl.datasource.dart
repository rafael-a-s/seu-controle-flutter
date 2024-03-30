import 'package:clean_architeture_flutter/features/user/interactor/entity/user.entity.dart';
import 'package:clean_architeture_flutter/features/user/interactor/states/user.state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../interactor/datasource/user.datasource.dart';

class UserDatasourceImpl implements UserDatasource {

  final CollectionReference firestore;


  UserDatasourceImpl({required this.firestore});

  @override
  Future<UserState> create(UserFirebase userFirebase) async {
    await firestore.doc(userFirebase.uid).set(userFirebase);
    final doc = await firestore.doc(userFirebase.uid).get();
    final user = doc.data() as UserFirebase;

    return UserStateCreate(userFirebase: user);
  }

  @override
  Future<UserState> getUser(String id) async {
    final ref = firestore.doc(id);
    final doc = await ref.get();
    if(doc.exists) {
      final user = doc.data();
      return UserStateGetted(userFirebase: user as UserFirebase);
    }

    return const UserStateEmpty();
  }



}
