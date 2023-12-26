import 'package:clean_architeture_flutter/features/core/constants/app_mask.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/controller/auth_sing_up.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'already_have_accout.dart';
import 'sign_up_button.dart';

class SignUpForm extends StatefulHookConsumerWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  _SingUpForm createState() => _SingUpForm();
}

class _SingUpForm extends ConsumerState<SignUpForm> {
  final _key = GlobalKey<FormState>();
  final _firstName = TextEditingController(text: 'Hemilly');
  final _lastName = TextEditingController(text: 'Christinne');
  final _cpf = TextEditingController(text: '070.860.363-74');
  final _email = TextEditingController(text: 'hemi@gmail.com');
  final _password = TextEditingController(text: 'R@fael123fd');

  singUp() async {
    final bool isFormOkay = _key.currentState!.validate();
    debugPrint(isFormOkay.toString());
    if (isFormOkay) {
      final user = <String, dynamic>{
        'firstName': _firstName.text,
        'lastName': _lastName.text,
        'cpf': _cpf.text,
        'email': _email.text,
        'password': _password.text,
      };

      await ref.read(authSingUpStateProvider.notifier).singUp(user);

      final location = ref.read(authSingUpStateProvider.notifier).state.uri;

      if (location!.isNotEmpty) {
        Modular.to.pushNamed('/auth${AppRoutes.login}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loading =
        ref.watch(authSingUpStateProvider.select((value) => value.isLoading));

    loading ? context.loaderOverlay.show() : context.loaderOverlay.hide();

    return Container(
      margin: const EdgeInsets.all(AppDefaults.margin),
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppDefaults.boxShadow,
        borderRadius: AppDefaults.borderRadius,
      ),
      child: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nome"),
            const SizedBox(height: 8),
            TextFormField(
              controller: _firstName,
              validator: Validators.name,
              textInputAction: TextInputAction.next,
            ),
            const Text("Sobrenome"),
            const SizedBox(height: 8),
            TextFormField(
              controller: _lastName,
              validator: Validators.name,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: AppDefaults.padding),
            const Text("Cpf"),
            const SizedBox(height: 8),
            TextFormField(
              controller: _cpf,
              validator: Validators.cpf,
              inputFormatters: [AppMask.cpf],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: AppDefaults.padding),
            const Text("Email"),
            const SizedBox(height: 8),
            TextFormField(
              controller: _email,
              validator: Validators.requiredWithFieldName('Email'),
              textInputAction: TextInputAction.next,
            ),
            const Text("Password"),
            const SizedBox(height: 8),
            TextFormField(
              controller: _password,
              validator: Validators.required,
              textInputAction: TextInputAction.next,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppIcons.eye,
                      width: 24,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDefaults.padding),
            SignUpButton(onPressed: loading ? () {} : singUp),
            const AlreadyHaveAnAccount(),
            const SizedBox(height: AppDefaults.padding),
          ],
        ),
      ),
    );
  }
}
