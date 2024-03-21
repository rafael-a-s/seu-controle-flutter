import 'package:animated_text_lerp/animated_text_lerp.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WageInfoComponent extends StatefulWidget {
  final double wage;

  const WageInfoComponent({required this.wage, super.key});

  @override
  State<WageInfoComponent> createState() => _WageInfoComponentState();
}

class _WageInfoComponentState extends State<WageInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Salário total",
              style: AppDefaults.textStyleHeader2,
            ),
            AnimatedNumberText<double>(
              widget.wage, // int or double
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
              style: AppDefaults.textStyleBalance,
              formatter: (value) => NumberFormat.currency(
                      locale: "pt_BR", name: "BRL", symbol: "R\$")
                  .format(value),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
