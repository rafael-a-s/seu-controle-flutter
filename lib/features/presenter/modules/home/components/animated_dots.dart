import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AnimatedDots extends StatelessWidget {
  const AnimatedDots({
    Key? key,
    required this.totalItems,
    required this.currentIndex,
  }) : super(key: key);

  final int totalItems;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalItems,
        (index) => AnimatedContainer(
          duration: AppDefaults.duration,
          height: 5,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 25 : 15,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.primary
                : const Color(0xFF9FC5A6),
            borderRadius: AppDefaults.borderRadius,
          ),
        ),
      ),
    );
  }
}
