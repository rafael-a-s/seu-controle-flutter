import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.second,
      appBar: AppBar(
        backgroundColor: AppColors.second,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: Padding(
        padding: AppDefaults.padinngDefault,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        AppImages.user_default,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 120,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Icon(Icons.edit),
                      ),
                    )
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(
                      "Rafael Aguiar",
                      style: AppDefaults.textStyleHeader1,
                    ),
                    Text(
                      "rafaelaguiar@gmail.com",
                      style: AppDefaults.textParagraphOpacity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: 160,
                        alignment: Alignment.center,
                        child: Text("Editar Perfil",
                            style: AppDefaults.textPlaceholderStyleDefault),
                      ),
                    )
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: AppColors.primaryOpacity,
                            ),
                            width: 45,
                            height: 45,
                            child: const Icon(
                              Icons.settings,
                            ),
                          ),
                          Text(
                            "Configurações",
                            style: AppDefaults.textStyleHeader3,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.primary,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: AppColors.primaryOpacity,
                            ),
                            width: 45,
                            height: 45,
                            child: const Icon(
                              Icons.feedback,
                            ),
                          ),
                          Text(
                            "Feedback",
                            style: AppDefaults.textStyleHeader3,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.primary,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: AppColors.primaryOpacity,
                            ),
                            width: 45,
                            height: 45,
                            child: const Icon(
                              Icons.analytics,
                            ),
                          ),
                          Text(
                            "Avalie-o",
                            style: AppDefaults.textStyleHeader3,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.primary,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color?>(Colors.red),
                      ),
                      child: SizedBox(
                        width: 160,
                        child: Text("Sair do Aplicativo",
                            style: AppDefaults.textStyleHeader3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
