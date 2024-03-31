import 'package:clean_architeture_flutter/features/core/components/button.component.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/blocs/bloc.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/entity/expense.entity.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/events/event.dart';
import 'package:clean_architeture_flutter/features/expense/interactor/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FormExpensePage extends StatefulWidget {
  final BuildContext parentContext;
  final Expense? expense;

  const FormExpensePage({required this.parentContext, this.expense, super.key});

  @override
  State<FormExpensePage> createState() => _FormExpensePageState();
}

class _FormExpensePageState extends State<FormExpensePage> {
  final bloc = Modular.get<ExpenseBloc>();
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _valueContribution = TextEditingController();
  final _dayDiscount = TextEditingController();

  onSubmit() {
    final bool isFormOkay = _key.currentState!.validate();
    if (isFormOkay) {
      widget.expense != null ? onEdit() : onCreate();
    }
  }

  void onCreate() {
    final expense = Expense(
      name: _name.text,
      value: double.parse(_valueContribution.text),
      dayDiscount: _dayDiscount.text,
    );

    bloc.add(ExpenseEventCreate(expense: expense));

    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: AppMessage.expenseCreated,
        backgroundColor: AppColors.primary,
      ),
    );

    // ignore: use_build_context_synchronously
    Navigator.pop(widget.parentContext);
  }

  void onEdit() {
    final monthlyForEdit = Expense(
      id: widget.expense!.id,
      name: _name.text,
      value: double.parse(_valueContribution.text),
      dayDiscount: _dayDiscount.text,
    );

    bloc.add(ExpenseEventUpdate(expense: monthlyForEdit));

    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: AppMessage.expenseEdited,
        backgroundColor: AppColors.primary,
      ),
    );

    // ignore: use_build_context_synchronously
    Navigator.pop(widget.parentContext);
  }

  void mountForm() {
    if (widget.expense != null) {
      _name.text = widget.expense!.name;
      _valueContribution.text = widget.expense!.value.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    mountForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldWithBoxBackground.withOpacity(.0),
        body: Padding(
          padding: AppDefaults.padinngDefault,
          child: StreamBuilder<Object>(
              stream: bloc.stream,
              builder: (context, snapshot) {
                final state = snapshot.data;

                final loading = state is ExpenseStateLoading;

                loading
                    ? context.loaderOverlay.show()
                    : context.loaderOverlay.hide();

                return SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(AppDefaults.margin),
                      padding: const EdgeInsets.all(AppDefaults.padding),
                      height: MediaQuery.of(context).size.height * 0.50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: AppDefaults.boxShadow,
                        borderRadius: AppDefaults.borderRadius,
                      ),
                      child: Form(
                        key: _key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Nome da Despesa"),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _name,
                                  validator: Validators.requiredWithFieldName(
                                      'Nome da Despesa'),
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      hintText: 'Ex: Aparelho'),
                                ),
                                const SizedBox(height: 8),
                                const Text("Valor da Despesa"),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _valueContribution,
                                  validator: Validators.positiveNumberWithDot,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: 'Ex: 180'),
                                ),
                                const SizedBox(height: 8),
                                const Text("Dia de Desconto"),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _dayDiscount,
                                  validator: Validators.required,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      const InputDecoration(hintText: 'Ex: 02'),
                                ),
                              ],
                            ),
                            ButtonComponent(onPressed: onSubmit, text: 'Salvar')
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
