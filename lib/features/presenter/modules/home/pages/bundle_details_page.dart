import 'package:clean_architeture_flutter/features/core/components/app_back_button.dart';
import 'package:flutter/material.dart';

class BundleDetailsPage extends StatelessWidget {
  const BundleDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Bundle Details Page'),
      ),
    );
  }
}
