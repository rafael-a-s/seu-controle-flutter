import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/entity/expense.entity.dart';
import 'package:flutter/material.dart';

class CardListExpenseComponent extends StatefulWidget {
  final int id;
  final Expense expense;
  const CardListExpenseComponent(
      {required this.id, required this.expense, super.key});

  @override
  State<CardListExpenseComponent> createState() =>
      _CardContributionComponentState();
}

class _CardContributionComponentState extends State<CardListExpenseComponent> {
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
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(.15),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Text(
              (widget.id + 1).toString(),
              style: AppDefaults.textStyleHeader2,
            ),
          ),
          Text(
            widget.expense.name,
            style: AppDefaults.textStyleHeader3,
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
