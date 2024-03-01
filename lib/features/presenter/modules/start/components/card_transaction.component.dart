import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_icons.dart';
import 'package:flutter/cupertino.dart';

class CardTransactionComponent extends StatefulWidget {
  const CardTransactionComponent({super.key});

  @override
  State<CardTransactionComponent> createState() =>
      _CardTransactionComponentState();
}

class _CardTransactionComponentState extends State<CardTransactionComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 170,
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
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 205, 233, 205).withOpacity(.8),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Image.asset(AppIcons.spotify),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Spotify Premiun",
                style: AppDefaults.textStyleHeader3,
              ),
              Text(
                "Música",
                style: AppDefaults.textPlaceholderStyleDefault,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "- R\$ 11,99",
                style: AppDefaults.textStyleHeader3,
              ),
              Text(
                "07/12 22:06",
                style: AppDefaults.textPlaceholderStyleDefault,
              ),
            ],
          )
        ],
      ),
    );
  }
}
