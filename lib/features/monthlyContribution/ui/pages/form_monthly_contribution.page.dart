import 'dart:async';

import 'package:clean_architeture_flutter/features/auth/interactor/blocs/auth.bloc.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/events/auth.event.dart';
import 'package:clean_architeture_flutter/features/auth/interactor/states/auth_login.state.dart';
import 'package:clean_architeture_flutter/features/core/components/button.component.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/blocs/monthly_contribution.bloc.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/entity/monthly_contribution.entity.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/events/monthly_contribution.event.dart';
import 'package:clean_architeture_flutter/features/monthlyContribution/interactor/states/monthly_contribution.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FormMonthlyContributionPage extends StatefulWidget {
  final BuildContext parentContext;
  final MonthlyContribution? monthlyContribution;

  const FormMonthlyContributionPage(
      {required this.parentContext, this.monthlyContribution, super.key});

  @override
  State<FormMonthlyContributionPage> createState() =>
      _FormMonthlyContributionPageState();
}

class _FormMonthlyContributionPageState
    extends State<FormMonthlyContributionPage> {

  final bloc = Modular.get<MonthlyContributinoBloc>();
  final blocAuth = Modular.get<AuthBloc>();
  final _key = GlobalKey<FormState>();
  late final StreamSubscription _subscriptionAuthBloc;
  final _nameInvestiment = TextEditingController();
  final _valueContribution = TextEditingController();
  late final _userUid;

  onSubmit() {
    final bool isFormOkay = _key.currentState!.validate();
    if (isFormOkay) {
      widget.monthlyContribution != null ? onEdit() : onCreate();
    }
  }

  void onCreate() {
    final monthlyContribution = MonthlyContribution(
        userUid: _userUid,
        nameInvestiment: _nameInvestiment.text,
        value: double.parse(_valueContribution.text));

    bloc.add(MonthlyContributionEventCreate(monthlyContribution: monthlyContribution));

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

  void onEdit() {
    final monthlyForEdit = MonthlyContribution(
        id: widget.monthlyContribution!.id,
        userUid: _userUid,
        nameInvestiment: _nameInvestiment.text,
        value: double.parse(_valueContribution.text));

    bloc.add(MonthlyContributionEventUpdate(monthlyContribution: monthlyForEdit));

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
    blocAuth.add(GetUserCurrentAuthUserEvent());
    _subscriptionAuthBloc = context.read<AuthBloc>().stream.listen((state) {
      if(state is AuthStateGetCurrentUser) {
        _userUid = state.authUser.uid;
      }
    });
    mountForm();
  }

  @override
  void dispose() {
    _subscriptionAuthBloc.cancel();
    super.dispose();
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

              final loading = state is MonthlyContributionStateLoading;

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
              );
            }
          ),
        ));
  }
}
