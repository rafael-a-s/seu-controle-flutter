import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_icons.dart';
import 'package:flutter/cupertino.dart';

class CardExpenseComponent extends StatefulWidget {
  const CardExpenseComponent({super.key});

  @override
  State<CardExpenseComponent> createState() => _CardExpenseComponentState();
}

class _CardExpenseComponentState extends State<CardExpenseComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 170,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            AppIcons.graficBarras,
            width: 130,
          ),
          Text(
            "R\$ 150,86",
            style: AppDefaults.textStyleBalanceMinimun,
          ),
          Text(
            "Despesas",
            style: AppDefaults.textPlaceholderStyleDefault,
          ),
        ],
      ),
    );
  }
}
