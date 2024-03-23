import 'package:clean_architeture_flutter/features/auth/interactor/entity/auth_user.entity.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control_metric.entity.dart';
import 'package:clean_architeture_flutter/features/home/blocs/home.bloc.dart';
import 'package:clean_architeture_flutter/features/home/events/home.event.dart';
import 'package:clean_architeture_flutter/features/home/states/home.state.dart';
import 'package:clean_architeture_flutter/features/start/ui/components/app_bar_home.component.dart';
import 'package:clean_architeture_flutter/features/start/ui/components/card_expense.component.dart';
import 'package:clean_architeture_flutter/features/start/ui/components/card_monthly_contribution.component.dart';
import 'package:clean_architeture_flutter/features/start/ui/components/card_sub_total_monthly.component.dart';
import 'package:clean_architeture_flutter/features/start/ui/components/card_total_spend_week.component.dart';
import 'package:clean_architeture_flutter/features/start/ui/components/card_transaction.component.dart';
import 'package:clean_architeture_flutter/features/start/ui/components/wage_info.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final bloc = Modular.get<HomeBloc>();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      bloc.add(HomeEventGettedUser());
    });
    super.initState();
  }

  _fetchData() async {}

  _refreshData() async {}

  final _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.second,
      body: Padding(
        padding: AppDefaults.padinngDefault,
        child: StreamBuilder(
          stream: bloc.stream,
          builder: (context, snapshot) {
            final state = snapshot.data;
            final loading = state is HomeStateLoading;
            final AuthUser authUser;
            state is HomeStateGettedUser ?
            authUser = state.authUser
                : authUser = AuthUser(name: "", email: "", uid: "");



            final financeControlMetrics = FinanceControlMetric(
              subTotalForMonth: 20,
              totalExpenses: 34,
              totalInvestimentMonth: 122,
              totalRemuneration: 2342,
              totalSpendForWeek: 3423,
            );

            loading ? context.loaderOverlay.show() : context.loaderOverlay.hide();

            return SafeArea(
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
                      id: authUser.uid,
                      name: authUser.name,
                      photoUrl: authUser.photoURL ?? "",
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: WageInfoComponent(
                        wage: financeControlMetrics.totalRemuneration ?? 0.0,
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
                                onTap: () =>
                                    Modular.to
                                        .pushNamed(
                                        AppRoutes.monthlyContribution),
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
                          subTotal: financeControlMetrics.subTotalForMonth ??
                              0.0),
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
            );
          }
        ),
      ),
    );
  }
}
