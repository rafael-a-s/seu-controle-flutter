import 'package:clean_architeture_flutter/features/core/constants/app_images.dart';
import 'package:flutter/material.dart';

import '../components/intro_page_background_wrapper.dart';
import '../components/intro_page_body_area.dart';

class IntroLoginPage extends StatelessWidget {
  const IntroLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          IntroLoginBackgroundWrapper(imageURL: AppImages.introBackground1),
          IntroPageBodyArea(),
        ],
      ),
    );
  }
}
