import 'package:clean_architeture_flutter/features/core/components/button.component.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/domain/entity/expense/expense.entity.dart';
import 'package:clean_architeture_flutter/features/domain/entity/typeExpense/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/submodule/typeExpense/controller/form_type_expense.controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FormTypeExpensePage extends StatefulHookConsumerWidget {
  final BuildContext parentContext;
  final TypeExpense? typeExpense;

  const FormTypeExpensePage(
      {required this.parentContext, this.typeExpense, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormTypeExpensePageState createState() => _FormTypeExpensePageState();
}

class _FormTypeExpensePageState extends ConsumerState<FormTypeExpensePage> {
  final _key = GlobalKey<FormState>();
  final _nameTypeExpense = TextEditingController();

  onSubmit() {
    final bool isFormOkay = _key.currentState!.validate();
    if (isFormOkay) {
      widget.typeExpense != null ? onEdit() : onCreate();
    }
  }

  void onCreate() async {
    final typeExpense = TypeExpense(
        nameOfExpense: _nameTypeExpense.text, expenses: <Expense>[]);

    await ref
        .read(formTypeExpenseStateProvider.notifier)
        .createTypeExpense(typeExpense);

    showTopSnackBar(
      // ignore: use_build_context_synchronously
      Overlay.of(context),
      const CustomSnackBar.success(
        message: AppMessage.typeExpenseCreated,
        backgroundColor: AppColors.primary,
      ),
    );

    // ignore: use_build_context_synchronously
    Navigator.pop(widget.parentContext);
  }

  void onEdit() async {
    final monthlyForEdit = TypeExpense(
      id: widget.typeExpense!.id,
      nameOfExpense: _nameTypeExpense.text,
      expenses: <Expense>[],
    );

    await ref
        .read(formTypeExpenseStateProvider.notifier)
        .editTypeExpense(monthlyForEdit);

    showTopSnackBar(
      // ignore: use_build_context_synchronously
      Overlay.of(context),
      const CustomSnackBar.success(
        message: AppMessage.typeExpenseEdited,
        backgroundColor: AppColors.primary,
      ),
    );

    // ignore: use_build_context_synchronously
    Navigator.pop(widget.parentContext);
  }

  void mountForm() {
    if (widget.typeExpense != null) {
      _nameTypeExpense.text = widget.typeExpense!.nameOfExpense;
    }
  }

  @override
  void initState() {
    super.initState();
    mountForm();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref
        .watch(formTypeExpenseStateProvider.select((value) => value.isLoading));

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
                        const Text("Nome da Categoria"),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _nameTypeExpense,
                          validator: Validators.requiredWithFieldName(
                              'Nome para Categoria'),
                          textInputAction: TextInputAction.next,
                          decoration:
                              const InputDecoration(hintText: 'Ex: Saúde'),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    ButtonComponent(onPressed: onSubmit, text: 'Salvar')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
