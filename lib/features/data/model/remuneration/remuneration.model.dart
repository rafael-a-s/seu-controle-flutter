import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/enum/type_remuneration_provider.enum.dart';

class RemunerationModel extends Remuneration {
  RemunerationModel({
    String? id,
    required super.provider,
    required super.value,
    required super.typeRemunerationProvider,
  }) : super(id: id);

  factory RemunerationModel.fromJson(Map<String, dynamic> json) {
    final typeRemunerationProvider = TypeRemunerationProvider.values.firstWhere(
        (element) =>
            element.name ==
            json['typeRemunerationProvider'].toString().toLowerCase(),
        orElse: () => TypeRemunerationProvider.other);
    return RemunerationModel(
      id: json['id'],
      provider: json['provider'],
      value: json['value'],
      typeRemunerationProvider: typeRemunerationProvider,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'provider': provider,
        'value': value,
        'typeRemunerationProvider': typeRemunerationProvider.name.toUpperCase(),
      };
}
