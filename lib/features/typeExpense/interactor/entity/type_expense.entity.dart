import 'package:clean_architeture_flutter/core/domain/base.entity.dart';

class TypeExpense extends BaseEntity {
  final String name;

  TypeExpense({
    dynamic id,
    required this.name,
  }) : super(id: id);

  List<Object> get props => [id, name];
}
