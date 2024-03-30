import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SignUpPageHeader extends StatelessWidget {
  const SignUpPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Text(
          'Bem vindo ao\nSeu Controle',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
