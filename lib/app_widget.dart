import 'dart:async';

import 'package:clean_architeture_flutter/features/auth/interactor/blocs/auth.bloc.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/states/auth_login.state.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/core/themes/app_themes.dart';
import 'package:clean_architeture_flutter/features/presenter/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  AppWidgetState createState() => AppWidgetState();
}

class AppWidgetState extends State<AppWidget> {
  late final StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = context.read<AuthBloc>().stream.listen(
          (state) {
        if (state is AuthStateSucess) {
          Modular.to.navigate(AppRoutes.start);
        } else if (state is AuthStateLogout) {
          Modular.to.navigate(AppRoutes.auth);
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => MaterialClassicHeader(),
      footerBuilder: () => ClassicFooter(),
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: false,
      shouldFooterFollowWhenNotFull: (state) {
        // If you want load more with noMoreData state ,may be you should return false
        return false;
      },
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.defaultTheme,
          darkTheme:
              ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          localizationsDelegates: const [
            RefreshLocalizations.delegate,
          ],
          builder: (context, child) => ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: LoaderOverlay(
              useDefaultLoading: false,
              overlayWidgetBuilder: (_) {
                //ignored progress for the moment
                return const Center(
                  child: SpinKitCubeGrid(
                    color: AppColors.primary,
                    size: 50.0,
                  ),
                );
              },
              overlayColor: AppColors.white.withOpacity(.8),
              child: child as Widget,
            ),
          ),
          routerConfig: Modular.routerConfig,
        ),
      ),
    );
  }
}
