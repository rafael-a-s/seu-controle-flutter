import 'package:clean_architeture_flutter/features/core/components/button.component.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/blocs/bloc.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/entity/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/events/event.dart';
import 'package:clean_architeture_flutter/features/remuneration/interactor/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FormRemunerationPage extends StatefulWidget {
  final BuildContext parentContext;
  final Remuneration? remuneration;

  const FormRemunerationPage(
      {required this.parentContext, this.remuneration, super.key});

  @override
  State<FormRemunerationPage> createState() =>
      _FormRemunerationPageState();
}

class _FormRemunerationPageState
    extends State<FormRemunerationPage> {

  final bloc = Modular.get<MonthlyContributinoBloc>();
  final _key = GlobalKey<FormState>();
  final _providerInvestiment = TextEditingController();
  final _valueContribution = TextEditingController();

  onSubmit() {
    final bool isFormOkay = _key.currentState!.validate();
    if (isFormOkay) {
      widget.remuneration != null ? onEdit() : onCreate();
    }
  }

  void onCreate() {
    final remuneration = Remuneration(
        provider: _providerInvestiment.text,
        value: double.parse(_valueContribution.text));

    bloc.add(RemunerationEventCreate(remuneration: remuneration));

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
    final monthlyForEdit = Remuneration(
        id: widget.remuneration!.id,
        provider: _providerInvestiment.text,
        value: double.parse(_valueContribution.text));

    bloc.add(RemunerationEventUpdate(remuneration: monthlyForEdit));

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
    if (widget.remuneration != null) {
      _providerInvestiment.text = widget.remuneration!.provider;
      _valueContribution.text = widget.remuneration!.value.toString();
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

              final loading = state is RemunerationStateLoading;

              loading ? context.loaderOverlay.show() : context.loaderOverlay.hide();

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
                              const Text("Nome do Provedor"),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: _providerInvestiment,
                                validator: Validators.requiredWithFieldName(
                                    'Nome do Provedor'),
                                textInputAction: TextInputAction.next,
                                decoration:
                                    const InputDecoration(hintText: 'Ex: Americanas LTDA'),
                              ),
                              const SizedBox(height: 8),
                              const Text("Valor da remuneração"),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: _valueContribution,
                                validator: Validators.positiveNumberWithDot,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration:
                                    const InputDecoration(hintText: 'Ex: 1414'),
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
            }
          ),
        ));
  }
}
