import 'package:clean_architeture_flutter/app_widget.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/base/base_widget.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/pages/home.page.dart';
import 'package:clean_architeture_flutter/features/presenter/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppWidget extends StatefulHookConsumerWidget {
  const AppWidget({super.key});

  @override
  AppWidgetState createState() => AppWidgetState();
}

class AppWidgetState extends ConsumerState<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref
        .watch(appWidgetControllerProvider.select((value) => value.themeMode));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: themeMode,
      builder: (context, child) => child as Widget,
      initialRoute: "/home",
    ).modular();
  }
}
