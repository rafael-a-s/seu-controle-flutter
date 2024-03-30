import 'package:clean_architeture_flutter/features/user/interactor/entity/user.entity.dart';
import 'package:clean_architeture_flutter/features/user/interactor/states/user.state.dart';

abstract interface class UserDatasource {

  Future<UserState> create(UserFirebase userFirebase);
  Future<UserState> getUser(String id);
}
