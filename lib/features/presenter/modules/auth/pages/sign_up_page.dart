import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

import '../components/sign_up_form.dart';
import '../components/sign_up_page_header.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldWithBoxBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignUpPageHeader(),
                SizedBox(height: AppDefaults.padding),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
