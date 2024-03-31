import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/entity/type_expense.entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardListTypeExpenseComponent extends StatefulWidget {
  final int id;
  final TypeExpense typeExpense;
  const CardListTypeExpenseComponent(
      {required this.id, required this.typeExpense, super.key});

  @override
  State<CardListTypeExpenseComponent> createState() =>
      _CardContributionComponentState();
}

class _CardContributionComponentState extends State<CardListTypeExpenseComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed(AppRoutes.expense),
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.typeExpense.name,
              style: AppDefaults.textStyleHeader3,
            ),
          ],
        ),
      ),
    );
  }
}
