import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/home/ui/pages/home_page.dart';
import 'package:clean_architeture_flutter/features/profile/ui/pages/profile.page.dart';
import 'package:clean_architeture_flutter/features/user/interactor/blocs/user.bloc.dart';
import 'package:clean_architeture_flutter/features/user/interactor/events/user.event.dart';
import 'package:clean_architeture_flutter/features/user/interactor/states/user.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  final pageController = PageController();
  final userBloc = Modular.get<UserBloc>();

  @override
  void initState() {
    userBloc.add(ValideUserAfterLoginUserEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: userBloc.stream,
        builder: (context, snapshot) {
          final state = snapshot.data;

          if (state is UserStateNew) {
            return LoaderOverlay(
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
              child: const Text("Estamos criando seu perfil..."),
            );
          } else {
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
                        label: "Perfil",
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
                  const ProfilePage(),
                ],
              ),
            );
          }
        });
  }
}
