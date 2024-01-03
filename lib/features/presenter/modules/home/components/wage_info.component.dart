import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_icons.dart';
import 'package:flutter/cupertino.dart';

class WageInfoComponent extends StatefulWidget {
  const WageInfoComponent({super.key});

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
              "\$ 1320,00",
              style: AppDefaults.textStyleBalance,
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 6,
          ),
          child: Image.asset(AppIcons.ocultar),
        ),
      ],
    );
  }
}
