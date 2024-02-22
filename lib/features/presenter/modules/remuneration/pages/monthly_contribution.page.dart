import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/remuneration/components/card_remuneration.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/remuneration/controller/monthly_contribution.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/remuneration/pages/form_monthly_contribution.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RemunerationPage extends StatefulHookConsumerWidget {
  const RemunerationPage({super.key});

  @override
  _RemunerationPageState createState() => _RemunerationPageState();
}

class _RemunerationPageState extends ConsumerState<RemunerationPage> {
  void _showModalNewContribution(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.scaffoldWithBoxBackground,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: FormRemunerationPage(
            parentContext: bc,
          ),
        );
      },
    ).whenComplete(() =>
        ref.read(remunerationStateProvider.notifier).getAllRemuneration());
  }

  void _showModalEditContribution(context, Remuneration remuneration) {
    showModalBottomSheet(
      backgroundColor: AppColors.scaffoldWithBoxBackground,
      context: context,
      builder: (BuildContext bc) {
        return FormRemunerationPage(
          parentContext: bc,
          remuneration: remuneration,
        );
      },
    ).whenComplete(() =>
        ref.read(remunerationStateProvider.notifier).getAllRemuneration());
  }

  void onDelete(String id) async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(remunerationStateProvider.notifier).deleteRemuneration(id);

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: AppMessage.monthlyContributionCreated,
          backgroundColor: AppColors.primary,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(remunerationStateProvider.notifier).getAllRemuneration();
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(
        remunerationStateProvider.select((value) => value.remunerations));

    final loading =
        ref.watch(remunerationStateProvider.select((value) => value.isLoading));

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
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Suas Fontes de renda',
                    style: AppDefaults.textStyleHeader1,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _showModalNewContribution(context),
                      child: Container(
                        height: 70,
                        width: 90,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Icon(Icons.add, size: 40),
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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Slidable(
                    key: ValueKey(index),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 2,
                          onPressed: (context) =>
                              _showModalEditContribution(context, list[index]),
                          backgroundColor: AppColors.second,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Editar',
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => onDelete(list[index].id),
                          backgroundColor: AppColors.second,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Excluir',
                        ),
                      ],
                    ),
                    child: CardRemunerationComponent(
                        id: index, remuneration: list[index]),
                  );
                }, childCount: list!.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
