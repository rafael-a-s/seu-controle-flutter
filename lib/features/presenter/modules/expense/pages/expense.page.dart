import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/expense/components/card_expense.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/expense/controller/expense.controller.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/expense/pages/form_expense.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ExpensePage extends StatefulHookConsumerWidget {
  const ExpensePage({
    super.key,
    required this.typeExpense,
  });

  final TypeExpense typeExpense;

  @override
  // ignore: library_private_types_in_public_api
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends ConsumerState<ExpensePage> {
  void _showModalNewContribution(context) {
    showModalBottomSheet(
      backgroundColor: AppColors.scaffoldWithBoxBackground,
      context: context,
      builder: (BuildContext bc) {
        return FormExpensePage(
          parentContext: bc,
        );
      },
    ).whenComplete(
        () => ref.read(expenseStateProvider.notifier).getAllExpense());
  }

  void _showModalEditContribution(context, Expense expense) {
    showModalBottomSheet(
      backgroundColor: AppColors.scaffoldWithBoxBackground,
      context: context,
      builder: (BuildContext bc) {
        return FormExpensePage(
          parentContext: bc,
          expense: expense,
        );
      },
    ).whenComplete(
        () => ref.read(expenseStateProvider.notifier).getAllExpense());
  }

  void onDelete(String id) async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(expenseStateProvider.notifier).deleteExpense(id);

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: AppMessage.expenseDelete,
          backgroundColor: AppColors.primary,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(expenseStateProvider.notifier).getAllExpense();
    });
  }

  @override
  Widget build(BuildContext context) {
    final list =
        ref.watch(expenseStateProvider.select((value) => value.expense));

    final loading =
        ref.watch(expenseStateProvider.select((value) => value.isLoading));

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
                    widget.typeExpense.nameOfExpense,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child:
                        CardExpenseComponent(id: index, expense: list[index]),
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
