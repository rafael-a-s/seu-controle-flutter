import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/user.model.dart';

abstract class UserDatasource extends IBaseDatasource<UserModel, dynamic> {
  UserDatasource({required super.api});
}
