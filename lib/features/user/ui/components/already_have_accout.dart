import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already Have Account?'),
        TextButton(
          onPressed: () => Modular.to.pushNamed('/auth${AppRoutes.login}'),
          child: const Text('Log In'),
        ),
      ],
    );
  }
}
