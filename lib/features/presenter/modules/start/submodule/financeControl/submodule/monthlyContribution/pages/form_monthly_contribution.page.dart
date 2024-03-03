import 'package:clean_architeture_flutter/features/core/components/button.component.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/start/submodule/financeControl/submodule/monthlyContribution/controller/form_monthly_contribution.controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FormMonthlyContributionPage extends StatefulHookConsumerWidget {
  final BuildContext parentContext;
  final MonthlyContribution? monthlyContribution;

  const FormMonthlyContributionPage(
      {required this.parentContext, this.monthlyContribution, super.key});

  @override
  _FormMonthlyContributionPageState createState() =>
      _FormMonthlyContributionPageState();
}

class _FormMonthlyContributionPageState
    extends ConsumerState<FormMonthlyContributionPage> {
  final _key = GlobalKey<FormState>();
  final _nameInvestiment = TextEditingController();
  final _valueContribution = TextEditingController();

  onSubmit() {
    final bool isFormOkay = _key.currentState!.validate();
    if (isFormOkay) {
      widget.monthlyContribution != null ? onEdit() : onCreate();
    }
  }

  void onCreate() async {
    final monthlyContribution = MonthlyContribution(
        nameInvestiment: _nameInvestiment.text,
        value: double.parse(_valueContribution.text));

    await ref
        .read(formMonthlyContributionStateProvider.notifier)
        .createMonthlyContribution(monthlyContribution);

    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: AppMessage.monthlyContributionCreated,
        backgroundColor: AppColors.primary,
      ),
    );

    // ignore: use_build_context_synchronously
    Navigator.pop(widget.parentContext);
  }

  void onEdit() async {
    final monthlyForEdit = MonthlyContribution(
        id: widget.monthlyContribution!.id,
        nameInvestiment: _nameInvestiment.text,
        value: double.parse(_valueContribution.text));

    await ref
        .read(formMonthlyContributionStateProvider.notifier)
        .editMonthlyContribution(monthlyForEdit);

    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: AppMessage.monthlyContributionEdited,
        backgroundColor: AppColors.primary,
      ),
    );

    // ignore: use_build_context_synchronously
    Navigator.pop(widget.parentContext);
  }

  void mountForm() {
    if (widget.monthlyContribution != null) {
      _nameInvestiment.text = widget.monthlyContribution!.nameInvestiment;
      _valueContribution.text = widget.monthlyContribution!.value.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    mountForm();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(formMonthlyContributionStateProvider
        .select((value) => value.isLoading));

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
                          const Text("Nome do Investimento"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _nameInvestiment,
                            validator: Validators.requiredWithFieldName(
                                'Nome do Investimento'),
                            textInputAction: TextInputAction.next,
                            decoration:
                                const InputDecoration(hintText: 'Ex: Mxr11'),
                          ),
                          const SizedBox(height: 8),
                          const Text("Valor do Aporte"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _valueContribution,
                            validator: Validators.positiveNumberWithDot,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(hintText: 'Ex: 100'),
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
        ));
  }
}
