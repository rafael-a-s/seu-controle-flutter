import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/pages/home_page.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/pages/profile.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartPage extends StatefulHookConsumerWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPage createState() => _StartPage();
}

class _StartPage extends ConsumerState<StartPage> {
  final pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.second,
      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            currentIndex: pageController.page?.round() ?? 0,
            onTap: (index) {
              pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "Line",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Perfifl",
              ),
            ],
          );
        },
      ),
      body: PageView(
        controller: pageController,
        children: [
          const HomePage(),
          Container(),
          const ProfilePage(id: "df"),
        ],
      ),
    );
  }
}
