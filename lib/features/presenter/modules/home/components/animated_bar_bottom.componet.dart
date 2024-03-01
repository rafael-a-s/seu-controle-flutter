import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedBarBottom extends StatelessWidget {
  const AnimatedBarBottom({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
