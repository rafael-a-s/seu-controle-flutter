import 'package:clean_architeture_flutter/features/presenter/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      builder: (context, child) => BaseWidget(child: child ?? Container()),
      initialRoute: "/home",
    ).modular();
  }
}
