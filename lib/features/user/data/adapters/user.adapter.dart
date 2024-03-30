import 'package:clean_architeture_flutter/features/user/interactor/entity/user.entity.dart';

class UserAdapter {
  static UserFirebase fromFirebaseUser(Map<String, dynamic> doc, String id) {
    return UserFirebase(uid: id, isNew: doc['isNew']);
  }

  static Map<String, dynamic> toFirebase(UserFirebase userFirebase) {
    return {
      'uid': userFirebase.uid,
      'isNew': userFirebase.isNew,
    };
  }
}
