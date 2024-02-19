import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:flutter/material.dart';

class CardRemunerationComponent extends StatefulWidget {
  final int id;
  final Remuneration remuneration;
  const CardRemunerationComponent(
      {required this.id, required this.remuneration, super.key});

  @override
  State<CardRemunerationComponent> createState() =>
      _CardRemunerationComponentState();
}

class _CardRemunerationComponentState extends State<CardRemunerationComponent> {
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
            widget.remuneration.provider,
            style: AppDefaults.textStyleHeader3,
          ),
          Text(
            "R\$ ${widget.remuneration.value}",
            style: AppDefaults.textStyleHeader3,
          ),
        ],
      ),
    );
  }
}
