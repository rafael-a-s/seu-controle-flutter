import 'package:clean_architeture_flutter/core/domain/base.entity.dart';

class Expense extends BaseEntity {
  final String name;
  final String dayDiscount;
  final double value;

  Expense({
    dynamic id,
    required this.name,
    required this.dayDiscount,
    required this.value,
  }) : super(id: id);

  List<Object> get props => [
        id,
        name,
        dayDiscount,
        value,
      ];
}
