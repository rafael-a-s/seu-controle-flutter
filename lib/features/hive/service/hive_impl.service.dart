import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/hive/service/hive.service.dart';
import 'package:hive/hive.dart';

class HiveServiceImpl implements HiveService {

  final HiveInterface hive;

  HiveServiceImpl(this.hive);

  @override
  Future<AuthUser> getAuthUser() async {
    var boxUser = await hive.openBox(AppKeyHive.userLogged);
    return boxUser.get(AppKeyHive.getUserLogged);
  }

  @override
  Future<void> pop() async {
    var boxUser = await hive.openBox(AppKeyHive.userLogged);
    boxUser.delete(AppKeyHive.getUserLogged);
  }

  @override
  Future<void> put(AuthUser user) async {
    var boxUser = await hive.openBox(AppKeyHive.userLogged);
    boxUser.put(AppKeyHive.getUserLogged, user);
  }
}