import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_icons.dart';
import 'package:flutter/cupertino.dart';

class CardTotalSpendWeekComponent extends StatefulWidget {
  final double totalSpendForWeek;
  const CardTotalSpendWeekComponent(
      {required this.totalSpendForWeek, super.key});

  @override
  State<CardTotalSpendWeekComponent> createState() =>
      _CardTotalSpendWeekComponentState();
}

class _CardTotalSpendWeekComponentState
    extends State<CardTotalSpendWeekComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: 170,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppIcons.estimativa,
                height: 30,
              ),
              Text(
                "Total \nSemanal",
                style: AppDefaults.textPlaceholderStyleDefault,
              ),
              Text(
                widget.totalSpendForWeek.toStringAsFixed(2),
                style: AppDefaults.textStyleBalanceMinimun,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "15%",
                style: AppDefaults.textStylePorcent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
