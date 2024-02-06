import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';

abstract class IBaseDatasource<T extends BaseEntity, ID> {
  final String api;

  IBaseDatasource({required this.api});

  Future<List<T>> getAll();

  Future<T> get(ID id);

  Future<T> create(T model);

  Future<T> update(T model);

  Future<int?> delete(ID id);

  JsonModelConvert<T> getJsonConvert();
}
