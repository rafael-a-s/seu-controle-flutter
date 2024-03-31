import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/blocs/bloc.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/entity/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/events/event.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/states/state.dart';
import 'package:clean_architeture_flutter/features/typeExpense/ui/components/card_list.component.dart';
import 'package:clean_architeture_flutter/features/typeExpense/ui/pages/form.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TypeExpensePage extends StatefulWidget {
  const TypeExpensePage({super.key});

  @override
  State<TypeExpensePage> createState() =>
      _TypeExpensePageState();
}

class _TypeExpensePageState
    extends State<TypeExpensePage> {

  final bloc = Modular.get<TypeExpenseBloc>();

  void _showModalNewContribution(context) {
    showModalBottomSheet(
      backgroundColor: AppColors.scaffoldWithBoxBackground,
      context: context,
      builder: (BuildContext bc) {
        return FormTypeExpensePage(
          parentContext: bc,
        );
      },
    ).whenComplete(() => bloc.add(TypeExpenseEventGetAll()));
  }

  void _showModalEditContribution(
      context, TypeExpense typeExpense) {
    showModalBottomSheet(
      backgroundColor: AppColors.scaffoldWithBoxBackground,
      context: context,
      builder: (BuildContext bc) {
        return FormTypeExpensePage(
          parentContext: bc,
          typeExpense: typeExpense,
        );
      },
    ).whenComplete(() => bloc.add(TypeExpenseEventGetAll()));
  }

  void onDelete(String id) async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      bloc.add(TypeExpenseEventDelete());

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
      bloc.add(TypeExpenseEventGetAll());
    });
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
        child: StreamBuilder<Object>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            final state = snapshot.data;
            List<TypeExpense> list = [];
            state is TypeExpenseStateGetted ? list = state.list : list = [];

            final loading = state is TypeExpenseStateLoading;

            loading ? context.loaderOverlay.show() : context.loaderOverlay.hide();

            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Despensas',
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
                      return GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed(AppRoutes.expense, arguments: list[index].id);
                        },
                        child: Slidable(
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
                          child: CardListTypeExpenseComponent(
                              id: index, typeExpense: list[index]),
                        ),
                      );
                    }, childCount: list!.length),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
