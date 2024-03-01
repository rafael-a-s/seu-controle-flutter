import 'package:clean_architeture_flutter/features/core/components/button.component.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/submodule/expense/controller/form_expense.controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FormExpensePage extends StatefulHookConsumerWidget {
  final BuildContext parentContext;
  final Expense? expense;

  const FormExpensePage({required this.parentContext, this.expense, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormExpensePageState createState() => _FormExpensePageState();
}

class _FormExpensePageState extends ConsumerState<FormExpensePage> {
  final _key = GlobalKey<FormState>();
  final _nameExpense = TextEditingController();
  final _valueExpense = TextEditingController();
  final _dayDiscount = TextEditingController();

  onSubmit() {
    final bool isFormOkay = _key.currentState!.validate();
    if (isFormOkay) {
      widget.expense!.id != null ? onEdit() : onCreate();
    }
  }

  void onCreate() async {
    final expense = Expense(
      name: _nameExpense.text,
      value: double.parse(_valueExpense.text),
      dayDiscount: _dayDiscount.text,
      typeExpense: widget.expense!.typeExpense,
    );

    await ref.read(formExpenseStateProvider.notifier).createExpense(expense);

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

  void onEdit() async {
    final monthlyForEdit = Expense(
      id: widget.expense!.id,
      name: _nameExpense.text,
      value: double.parse(_valueExpense.text),
      dayDiscount: _dayDiscount.text,
      typeExpense: widget.expense!.typeExpense,
    );

    await ref
        .read(formExpenseStateProvider.notifier)
        .editExpense(monthlyForEdit);

    showTopSnackBar(
      // ignore: use_build_context_synchronously
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
    if (widget.expense!.id != null) {
      _nameExpense.text = widget.expense!.name;
      _valueExpense.text = widget.expense!.value.toString();
      _dayDiscount.text = widget.expense!.dayDiscount;
    }
  }

  @override
  void initState() {
    super.initState();
    mountForm();
  }

  @override
  Widget build(BuildContext context) {
    final loading =
        ref.watch(formExpenseStateProvider.select((value) => value.isLoading));

    loading ? context.loaderOverlay.show() : context.loaderOverlay.hide();
    return Scaffold(
        backgroundColor: AppColors.scaffoldWithBoxBackground.withOpacity(.0),
        body: Padding(
          padding: AppDefaults.padinngDefault,
          child: SafeArea(
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
                            controller: _nameExpense,
                            validator: Validators.requiredWithFieldName(
                                'Nome da Despesa'),
                            textInputAction: TextInputAction.next,
                            decoration:
                                const InputDecoration(hintText: 'Ex: Netflix'),
                          ),
                          const SizedBox(height: 8),
                          const Text("Valor"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _valueExpense,
                            validator: Validators.positiveNumberWithDot,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(hintText: 'Ex: 54,99'),
                          ),
                          const SizedBox(height: 8),
                          const Text("Dia do desconto"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _dayDiscount,
                            validator: Validators.positiveNumberWithDot,
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
          ),
        ));
  }
}
