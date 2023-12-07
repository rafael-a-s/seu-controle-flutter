import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.second,
      body: Padding(
        padding: AppDefaults.padinngDefault,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverAppBar(
                backgroundColor: AppColors.second,
                titleSpacing: 40,
                leading: Image.asset(AppImages.user_default),
                floating: true,
                title: Padding(
                  padding: EdgeInsets.only(
                    top: 25,
                  ),
                  child: Text(
                    "Olá, Rafael!",
                    style: AppDefaults.textStyleHeader1,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Modular.to.pushNamed("/onboarding/home/search");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.second,
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salário total",
                          style: AppDefaults.textStyleHeader2,
                        ),
                        Text(
                          "\$ 1320,00",
                          style: AppDefaults.textStyleBalance,
                        ),
                      ],
                    ),
                    SizedBox(
                       width: 10,
                    ),
                    Icon(Icons.hide_source, color: AppColors.white,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
