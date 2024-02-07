import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';

class RemunerationModel extends Remuneration {
  RemunerationModel({
    String? id,
    required super.provider,
    required super.value,
    required super.typeRemunerationProvider,
  }) : super(id: id);

  factory RemunerationModel.fromJson(Map<String, dynamic> json) =>
      RemunerationModel(
        id: json['id'],
        provider: json['provider'],
        value: json['value'],
        typeRemunerationProvider: json['typeRemunerationProvider'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'provider': provider,
        'value': value,
        'typeRemunerationProvider': typeRemunerationProvider,
      };
}
