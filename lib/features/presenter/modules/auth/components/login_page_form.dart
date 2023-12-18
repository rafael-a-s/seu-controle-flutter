import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/core/themes/app_themes.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/domain/entity/auth_user.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/auth/controller/auth_login.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_button.dart';

class LoginPageForm extends StatefulHookConsumerWidget {
  const LoginPageForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends ConsumerState<LoginPageForm> {
  final _key = GlobalKey<FormState>();
  final _cpf = TextEditingController();
  final _password = TextEditingController();

  bool isPasswordShown = false;
  onPassShowClicked() {
    isPasswordShown = !isPasswordShown;
    setState(() {});
  }

  onLogin() {
    final bool isFormOkay = _key.currentState?.validate() ?? false;
    if (isFormOkay) {
      ref
          .read(authLoginStateProvider.notifier)
          .login(_cpf.text, _password.text);

      final authUser = ref.read(authLoginStateProvider.notifier).state.authUser;

      if (authUser != null) {
        saveUserLogged(authUser);
        Modular.to.pushNamed(AppRoutes.home);
      }
    }
  }

  saveUserLogged(AuthUser authUser) async {
    var box = await Hive.openBox(AppKeyHive.userLogged);

    box.put(AppKeyHive.getUserLogged, authUser);
  }

  @override
  Widget build(BuildContext context) {
    final loading =
        ref.watch(authLoginStateProvider.select((value) => value.isLoading));

    final authUserLogged =
        ref.watch(authLoginStateProvider.select((value) => value.authUser));

    return Theme(
      data: AppTheme.defaultTheme.copyWith(
        inputDecorationTheme: AppTheme.secondaryInputDecorationTheme,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Cpf"),

              const SizedBox(height: 8),

              TextFormField(
                controller: _cpf,
                keyboardType: TextInputType.number,
                validator: Validators.requiredWithFieldName('Cpf'),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppDefaults.padding),

              const Text("Senha"),

              const SizedBox(height: 8),
              TextFormField(
                controller: _password,
                validator: Validators.password,
                onFieldSubmitted: (v) => onLogin(),
                textInputAction: TextInputAction.done,
                obscureText: !isPasswordShown,
                decoration: InputDecoration(
                  suffixIcon: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: onPassShowClicked,
                      icon: SvgPicture.asset(
                        AppIcons.eye,
                        width: 24,
                      ),
                    ),
                  ),
                ),
              ),

              // Forget Password labelLarge
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPassword);
                  },
                  child: const Text('Esqueceu sua senha?'),
                ),
              ),

              // Login labelLarge
              LoginButton(onPressed: loading ? () {} : onLogin),
            ],
          ),
        ),
      ),
    );
  }
}
