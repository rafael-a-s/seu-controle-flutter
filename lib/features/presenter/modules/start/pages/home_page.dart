import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/components/card_expense.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/controller/home.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/components/app_bar_home.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/components/card_monthly_contribution.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/components/card_sub_total_monthly.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/components/card_total_spend_week.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/components/card_transaction.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/components/wage_info.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(homeStateProvider.notifier).loadingPage();
    });
  }

  _fetchData() async {
    ref.read(homeStateProvider.notifier).loadingPage();

    _refreshController.loadComplete();
  }

  _refreshData() async {
    ref.read(homeStateProvider.notifier).loadingPage();
    setState(() {});
    _refreshController.refreshCompleted();
  }

  final _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final loading =
        ref.watch(homeStateProvider.select((value) => value.isLoading));

    final authUser =
        ref.watch(homeStateProvider.select((value) => value.authUser));

    final financeControlMetrics = ref
        .watch(homeStateProvider.select((value) => value.financeControlMetric));

    loading ? context.loaderOverlay.show() : context.loaderOverlay.hide();

    return Scaffold(
      backgroundColor: AppColors.second,
      body: Padding(
        padding: AppDefaults.padinngDefault,
        child: SafeArea(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const WaterDropHeader(),
            controller: _refreshController,
            onLoading: _fetchData,
            onRefresh: _refreshData,
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                AppBarFinanceControlComponent(
                  id: authUser!.uid,
                  name: authUser.name ?? "Uknow",
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                SliverToBoxAdapter(
                  child: WageInfoComponent(
                    wage: financeControlMetrics!.totalRemuneration ?? 0.0,
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
                      GestureDetector(
                        onTap: () =>
                            Modular.to.pushNamed(AppRoutes.typeExpense),
                        child: CardExpenseComponent(
                          totalExpense:
                              financeControlMetrics.totalExpenses ?? 0.0,
                        ),
                      ),
                      Column(
                        children: [
                          CardTotalSpendWeekComponent(
                              totalSpendForWeek:
                                  financeControlMetrics.totalSpendForWeek ??
                                      0.0),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () => Modular.to
                                .pushNamed(AppRoutes.monthlyContribution),
                            child: CardMonthlyContributionComponent(
                                totalContribution: financeControlMetrics
                                        .totalInvestimentMonth ??
                                    0.0),
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
                  child: CardSubTotalMonthlyComponent(
                      subTotal: financeControlMetrics.subTotalForMonth ?? 0.0),
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
                        "Fontes de renda",
                        style: AppDefaults.textStyleHeader2,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Modular.to.pushNamed(AppRoutes.remuneration),
                        child: Text(
                          "Gerenciar",
                          style: AppDefaults.textStyleHeader2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: CardTransactionComponent(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: CardTransactionComponent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
