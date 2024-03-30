import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Não tem conta?'),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.signup),
          child: const Text('Crie sua conta'),
        ),
      ],
    );
  }
}
