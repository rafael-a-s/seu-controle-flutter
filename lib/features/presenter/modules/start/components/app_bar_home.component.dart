import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_images.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarFinanceControlComponent extends StatefulWidget {
  final String id;
  final String name;

  const AppBarFinanceControlComponent(
      {required this.id, required this.name, super.key});

  @override
  State<AppBarFinanceControlComponent> createState() =>
      _AppBarFinanceControlComponentState();
}

class _AppBarFinanceControlComponentState
    extends State<AppBarFinanceControlComponent> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.second,
      titleSpacing: 40,
      leading: Image.asset(AppImages.user_default),
      floating: true,
      title: Padding(
        padding: const EdgeInsets.only(
          top: 25,
        ),
        child: Text(
          widget.name,
          style: AppDefaults.textStyleHeader1,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Modular.to.pushNamed('${AppRoutes.profile}/${widget.id}');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.second,
            shape: const CircleBorder(),
          ),
          child: const Icon(
            Icons.person,
            size: 35,
          ),
        ),
      ],
    );
  }
}
