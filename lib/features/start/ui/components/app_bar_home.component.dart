import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_images.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarFinanceControlComponent extends StatefulWidget {
  final String id;
  final String name;
  final String photoUrl;

  const AppBarFinanceControlComponent(
      {required this.id,
      required this.name,
      required this.photoUrl,
      super.key});

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
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: widget.photoUrl != "" ? Image.network(
          widget.photoUrl ?? "",
          errorBuilder: (context, error, stackTrace) => Text("Erro ao carregar a imagem"),
        ) : Image.asset(AppImages.user_default),
      ),
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
