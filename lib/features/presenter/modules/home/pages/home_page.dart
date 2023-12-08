import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  padding: const EdgeInsets.only(
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
                      Modular.to.pushNamed("/onboarding/home/profile");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.second,
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
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
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 6,
                      ),
                      child: Image.asset(AppIcons.ocultar),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 300,
                      width: 170,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            AppIcons.graficBarras,
                            width: 130,
                          ),
                          Text(
                            "R\$ 150,86",
                            style: AppDefaults.textStyleBalanceMinimun,
                          ),
                          Text(
                            "Despesas",
                            style: AppDefaults.textPlaceholderStyleDefault,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 145,
                          width: 170,
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppIcons.estimativa,
                                    height: 30,
                                  ),
                                  Text(
                                    "Total \nSemanal",
                                    style:
                                        AppDefaults.textPlaceholderStyleDefault,
                                  ),
                                  Text(
                                    "R\$ 150,86",
                                    style: AppDefaults.textStyleBalanceMinimun,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "15%",
                                    style: AppDefaults.textStylePorcent,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 145,
                          width: 170,
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppIcons.doar,
                                    height: 30,
                                  ),
                                  Text(
                                    "Aporte \nMensal",
                                    style:
                                        AppDefaults.textPlaceholderStyleDefault,
                                  ),
                                  Text(
                                    "R\$ 150,86",
                                    style: AppDefaults.textStyleBalanceMinimun,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "15%",
                                    style: AppDefaults.textStylePorcent,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 145,
                  width: 170,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sub Total",
                            style: AppDefaults.textPlaceholderStyleDefault,
                          ),
                          Text(
                            "Quanto te \nsobra esse mês",
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(.6),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "R\$ 700,00",
                            style: AppDefaults.textStyleBalance,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "15%",
                            style: AppDefaults.textStylePorcent,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transações",
                      style: AppDefaults.textStyleHeader2,
                    ),
                    Text(
                      "Ver tudo",
                      style: AppDefaults.textStyleHeader2,
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 90,
                  width: 170,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 205, 233, 205)
                                .withOpacity(.8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Image.asset(AppIcons.spotify),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Spotify Premiun",
                            style: AppDefaults.textStyleHeader3,
                          ),
                          Text(
                            "Música",
                            style: AppDefaults.textPlaceholderStyleDefault,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "- R\$ 11,99",
                            style: AppDefaults.textStyleHeader3,
                          ),
                          Text(
                            "07/12 22:06",
                            style: AppDefaults.textPlaceholderStyleDefault,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 90,
                  width: 170,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 205, 233, 205)
                                .withOpacity(.8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Image.asset(AppIcons.netflix),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Netflix",
                            style: AppDefaults.textStyleHeader3,
                          ),
                          Text(
                            "Entreterimento",
                            style: AppDefaults.textPlaceholderStyleDefault,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "- R\$ 11,99",
                            style: AppDefaults.textStyleHeader3,
                          ),
                          Text(
                            "07/12 22:06",
                            style: AppDefaults.textPlaceholderStyleDefault,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
