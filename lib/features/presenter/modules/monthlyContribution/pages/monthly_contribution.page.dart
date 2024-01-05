import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/monthlyContribution/components/card_contribution.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/monthlyContribution/pages/form_monthly_contribution.page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    );
  }

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
                    return CardContributionComponent(id: index);
                  },
                  childCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
