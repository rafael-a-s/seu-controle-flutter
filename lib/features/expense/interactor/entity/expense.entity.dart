import 'package:clean_architeture_flutter/core/domain/base.entity.dart';

class Expense extends BaseEntity {
  final String name;
  final double value;
  final String dayDiscount;

  Expense({
    dynamic id,
    required this.name,
    required this.value,
    required this.dayDiscount,
  }) : super(id: id);

  List<Object> get props => [id, name, value, dayDiscount];
}
