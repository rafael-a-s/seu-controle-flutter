import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/core/models/check_box.model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxComponent extends StatefulWidget {
  CheckBoxComponent({required this.checkBoxModel, super.key});

  CheckBoxModel checkBoxModel;

  @override
  State<CheckBoxComponent> createState() => _CheckBoxComponentState();
}

class _CheckBoxComponentState extends State<CheckBoxComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 50, maxWidth: 150),
        decoration: const BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.checkBoxModel.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Checkbox(
              value: widget.checkBoxModel.isSelect ?? false,
              shape: const CircleBorder(),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
