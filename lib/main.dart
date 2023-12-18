import 'dart:io';

import 'package:clean_architeture_flutter/app_module.dart';
import 'package:clean_architeture_flutter/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  var path = Directory.current.path;
  Hive.init(path);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    );
  }
}
