import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_icons.dart';
import 'package:flutter/cupertino.dart';

class CardMonthlyContributionComponent extends StatefulWidget {
  final double totalContribution;
  const CardMonthlyContributionComponent(
      {required this.totalContribution, super.key});

  @override
  State<CardMonthlyContributionComponent> createState() =>
      _CardMonthlyContributionComponentState();
}

class _CardMonthlyContributionComponentState
    extends State<CardMonthlyContributionComponent> {
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
                AppIcons.doar,
                height: 30,
              ),
              Text(
                "Aporte \nMensal",
                style: AppDefaults.textPlaceholderStyleDefault,
              ),
              Text(
                widget.totalContribution.toString(),
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
