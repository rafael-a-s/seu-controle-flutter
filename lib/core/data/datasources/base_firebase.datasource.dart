import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseDatasourceFirebase<T extends BaseEntity, ID>
    extends IBaseDatasource<T, ID> {
  final CollectionReference client;
  BaseDatasourceFirebase({required this.client, required super.api});

  @override
  Future<List<T>> getAll() async {
    final response = await client.get();
    final docs = response.docs;
    return docs.map((e) => e.data()! as T).toList();
  }

  @override
  Future<T> get(ID id) async {
    throw Exception("Not implemented");
  }

  @override
  Future<T> create(T model) async {
    try {
      final JsonModelConvert<T> convert = getJsonConvert();
      await client.add(convert.toJson(model));
      return model;
    } on FirebaseException catch (e) {
      throw FirebaseException(message: "Erro ao criar um registro!", plugin: '');
    }
  }

  @override
  Future<T> update(T model) async {
    try {
      final JsonModelConvert<T> convert = getJsonConvert();
      await client.doc(model.id).update(convert.toJson(model));
      final documentUpdated = await client.doc(model.id).get();
      return convert.fromJson(documentUpdated.data() as Map<String, dynamic>);
    } on FirebaseException catch (e) {
      throw FirebaseException(message: "Erro ao Atualiar um registro!", plugin: '');
    }
  }

  @override
  Future<int?> delete(ID id) async {
   return 204;
  }
}
