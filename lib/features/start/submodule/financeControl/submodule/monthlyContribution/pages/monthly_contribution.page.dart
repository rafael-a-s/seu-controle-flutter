import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/start/submodule/financeControl/submodule/monthlyContribution/components/card_contribution.component.dart';
import 'package:clean_architeture_flutter/features/start/submodule/financeControl/submodule/monthlyContribution/controller/monthly_contribution.controller.dart';
import 'package:clean_architeture_flutter/features/start/submodule/financeControl/submodule/monthlyContribution/pages/form_monthly_contribution.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MonthlyContributionPage extends StatefulHookConsumerWidget {
  const MonthlyContributionPage({super.key});

  @override
  _MonthlyContributionPageState createState() =>
      _MonthlyContributionPageState();
}

class _MonthlyContributionPageState
    extends ConsumerState<MonthlyContributionPage> {
  void _showModalNewContribution(context) {
    showModalBottomSheet(
      backgroundColor: AppColors.scaffoldWithBoxBackground,
      context: context,
      builder: (BuildContext bc) {
        return FormMonthlyContributionPage(
          parentContext: bc,
        );
      },
    ).whenComplete(() => ref
        .read(monthlyContributionStateProvider.notifier)
        .getAllMonthlyContribution());
  }

  void _showModalEditContribution(
      context, MonthlyContribution monthlyContribution) {
    showModalBottomSheet(
      backgroundColor: AppColors.scaffoldWithBoxBackground,
      context: context,
      builder: (BuildContext bc) {
        return FormMonthlyContributionPage(
          parentContext: bc,
          monthlyContribution: monthlyContribution,
        );
      },
    ).whenComplete(() => ref
        .read(monthlyContributionStateProvider.notifier)
        .getAllMonthlyContribution());
  }

  void onDelete(String id) async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref
          .read(monthlyContributionStateProvider.notifier)
          .deleteMonthlyContribution(id);

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: AppMessage.monthlyContributionDelete,
          backgroundColor: AppColors.primary,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref
          .read(monthlyContributionStateProvider.notifier)
          .getAllMonthlyContribution();
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(monthlyContributionStateProvider
        .select((value) => value.monthlyContributions));

    final loading = ref.watch(
        monthlyContributionStateProvider.select((value) => value.isLoading));

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
                    'Aporte Mensal',
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
                    child: CardContributionComponent(
                        id: index, monthlyContribution: list[index]),
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
