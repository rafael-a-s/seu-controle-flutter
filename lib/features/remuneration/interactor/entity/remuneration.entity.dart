import 'package:clean_architeture_flutter/core/domain/base.entity.dart';

class Remuneration extends BaseEntity {
  final String provider;
  final double value;

  Remuneration({
    dynamic id,
    required this.provider,
    required this.value,
  }) : super(id: id);

  List<Object> get props => [id, provider, value];
}
