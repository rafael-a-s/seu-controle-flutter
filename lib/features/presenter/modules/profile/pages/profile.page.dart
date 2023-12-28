import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_images.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_key_hiver.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/profile/controller/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfilePage extends StatefulHookConsumerWidget {
  final String id;

  const ProfilePage({required this.id, super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(profileStateProvider.notifier).getUser(widget.id);
    });
  }

  logout() async {
    await ref.read(profileStateProvider.notifier).logout();

    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: AppMessage.logout,
        backgroundColor: AppColors.primary,
      ),
    );

    Modular.to.pushNamed(AppRoutes.auth);
  }

  @override
  Widget build(BuildContext context) {
    final loading =
        ref.watch(profileStateProvider.select((value) => value.isLoading));

    final user = ref.watch(profileStateProvider.select((value) => value.user));

    loading ? context.loaderOverlay.show() : context.loaderOverlay.hide();

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
                        child: const Icon(Icons.edit),
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
                      '${user!.firstName} ${user.lastName}',
                      style: AppDefaults.textStyleHeader1,
                    ),
                    Text(
                      user.email,
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
                      onPressed: () => logout(),
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
