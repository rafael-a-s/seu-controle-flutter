import 'package:clean_architeture_flutter/core/data/repositories/base.repository.dart';
import 'package:clean_architeture_flutter/core/domain/base_model.convert.dart';
import 'package:clean_architeture_flutter/features/data/datasource/user/user.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/user/user.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/user.entity.dart';
import 'package:clean_architeture_flutter/features/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends BaseRepository<User, UserModel, dynamic>
    implements UserRepository {
  final ModelConvert<User, UserModel> modelConvert = ModelConvert(
    fromEntity: (data) => User(
      id: data.id,
      firstName: data.firstName,
      lastName: data.lastName,
      cpf: data.cpf,
      email: data.email,
      roles: data.roles.map((value) => value).toSet(),
      financeControl: data.financeControl,
    ),
    toModel: ((entity) => UserModel(
          id: entity.id,
          firstName: entity.firstName,
          lastName: entity.lastName,
          cpf: entity.cpf,
          email: entity.email,
          roles: entity.roles.map((value) => value).toSet(),
          financeControl: entity.financeControl,
        )),
  );

  final UserDatasource _datasource;

  UserRepositoryImpl(this._datasource) : super(datasource: _datasource);

  @override
  ModelConvert<User, UserModel> getModelConvert() {
    return modelConvert;
  }

  @override
  UserDatasource get datasource => _datasource;
}
