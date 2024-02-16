import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:flutter/material.dart';

class CardExpenseComponent extends StatefulWidget {
  final Expense expense;
  const CardExpenseComponent({required this.expense, super.key});

  @override
  State<CardExpenseComponent> createState() => _CardExpenseComponentState();
}

class _CardExpenseComponentState extends State<CardExpenseComponent> {
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
          Flexible(
            child: Text(
              widget.expense.name,
              style: AppDefaults.textStyleHeader3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "R\$ ${widget.expense.value}",
            style: AppDefaults.textStyleHeader3,
          ),
        ],
      ),
    );
  }
}
