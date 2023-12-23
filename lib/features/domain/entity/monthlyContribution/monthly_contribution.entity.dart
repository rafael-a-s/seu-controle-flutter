import 'package:clean_architeture_flutter/core/domain/base.entity.dart';

class MonthlyContribution extends BaseEntity {
  final String nameInvestiment;
  final double value;

  MonthlyContribution({
    dynamic id,
    required this.nameInvestiment,
    required this.value,
  }) : super(id: id);

  List<Object> get props => [
        id,
        nameInvestiment,
        value,
      ];
}
