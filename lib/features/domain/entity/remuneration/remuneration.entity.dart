import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/features/domain/enum/type_remuneration_provider.enum.dart';

class Remuneration extends BaseEntity {
  final String provider;
  final double value;
  final TypeRemunerationProvider typeRemunerationProvider;

  Remuneration({
    dynamic id,
    required this.provider,
    required this.value,
    required this.typeRemunerationProvider,
  }) : super(id: id);

  List<Object> get props => [id, provider, value, typeRemunerationProvider];
}
