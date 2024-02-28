import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:flutter/material.dart';

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
            Text(
              widget.wage.toString(),
              style: AppDefaults.textStyleBalance,
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
