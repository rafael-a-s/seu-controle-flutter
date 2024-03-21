import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';
import 'package:flutter/material.dart';

class CardTypeExpenseComponent extends StatefulWidget {
  final int id;
  final TypeExpense expense;
  const CardTypeExpenseComponent(
      {required this.id, required this.expense, super.key});

  @override
  State<CardTypeExpenseComponent> createState() =>
      _CardTypeExpenseComponentState();
}

class _CardTypeExpenseComponentState extends State<CardTypeExpenseComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.expense.nameOfExpense,
            style: AppDefaults.textStyleHeader3,
          ),
          const Icon(
            Icons.ads_click,
            color: AppColors.coloredBackground,
          )
        ],
      ),
    );
  }
}
