import 'package:clean_architeture_flutter/features/remuneration/interactor/entity/remuneration.entity.dart';

class RemunerationAdapter {
  static Remuneration fromJson(Map<String, dynamic> doc, String id) {
    return Remuneration(
      id: id,
      provider: doc['provider'],
      value: doc['value'],
    );
  }

  static toJson(Remuneration entity) => {
        'provider': entity.provider,
        'value': entity.value,
      };
}
