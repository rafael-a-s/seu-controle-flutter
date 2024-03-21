import 'package:clean_architeture_flutter/features/auth/interactor/blocs/auth.bloc.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/events/auth.event.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/states/auth_login.state.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SocialLogins extends StatefulWidget{
  SocialLogins({
    Key? key,
  }) : super(key: key);

  @override
  State<SocialLogins> createState() => _SocialLoginsState();
}

class _SocialLoginsState extends State<SocialLogins>{

  late final bloc;

  @override
  void initState() {
    bloc = Modular.get<AuthBloc>();
    super.initState();
  }

  _handleGoogleSignIn() {
    final bloc = Modular.get<AuthBloc>();
    bloc.add(LoginAuthEvent());
  }

  @override
  Widget build(BuildContext context) {


    return StreamBuilder<AuthState>(
      stream: bloc.stream,
      builder: (context, snapshot) {
        final loading = snapshot.data is AuthStateLoading;

        if(snapshot.data is AuthStateSucess) {
          AuthStateSucess state = snapshot.data as AuthStateSucess;
          AuthUser? authUser = state.authUser;
          bloc.add(SucessLoginAuthEvent(authUser: authUser));
        }

        loading ? context.loaderOverlay.show() : context.loaderOverlay.hide();

        return  Padding(
          padding: const EdgeInsets.all(AppDefaults.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _handleGoogleSignIn(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding * 2,
                      vertical: AppDefaults.padding,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.googleIconRounded,
                        width: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Google',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppDefaults.margin),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding * 2,
                      vertical: AppDefaults.padding,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.appleIconRounded,
                        width: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Apple',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
