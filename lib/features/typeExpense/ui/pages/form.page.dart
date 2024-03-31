import 'package:clean_architeture_flutter/features/core/components/button.component.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/blocs/bloc.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/entity/type_expense.entity.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/events/event.dart';
import 'package:clean_architeture_flutter/features/typeExpense/interactor/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FormTypeExpensePage extends StatefulWidget {
  final BuildContext parentContext;
  final TypeExpense? typeExpense;

  const FormTypeExpensePage(
      {required this.parentContext, this.typeExpense, super.key});

  @override
  State<FormTypeExpensePage> createState() => _FormTypeExpensePageState();
}

class _FormTypeExpensePageState extends State<FormTypeExpensePage> {
  final bloc = Modular.get<TypeExpenseBloc>();
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();

  onSubmit() {
    final bool isFormOkay = _key.currentState!.validate();
    if (isFormOkay) {
      widget.typeExpense != null ? onEdit() : onCreate();
    }
  }

  void onCreate() {
    final typeExpense = TypeExpense(name: _name.text);

    bloc.add(TypeExpenseEventCreate(typeExpense: typeExpense));

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
    final monthlyForEdit = TypeExpense(
      id: widget.typeExpense!.id,
      name: _name.text,
    );

    bloc.add(TypeExpenseEventUpdate(typeExpense: monthlyForEdit));

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
    if (widget.typeExpense != null) {
      _name.text = widget.typeExpense!.name;
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

                final loading = state is TypeExpenseStateLoading;

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
                                const Text("Categoria da Despesa"),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _name,
                                  validator: Validators.requiredWithFieldName(
                                      'Categoria da Despensa'),
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      hintText: 'Ex: Saúde'),
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
                );
              }),
        ));
  }
}
