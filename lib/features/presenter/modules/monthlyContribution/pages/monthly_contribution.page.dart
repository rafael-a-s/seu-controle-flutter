import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
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
        child: const SafeArea(
          child: CustomScrollView(
              slivers: [SliverToBoxAdapter(child: Text('aporte mensal'))]),
        ),
      ),
    );
  }
}
