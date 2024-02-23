import 'package:clean_architeture_flutter/features/core/components/button.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/remuneration/components/check_box.component.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_colors.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_defaults.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_messages.dart';
import 'package:clean_architeture_flutter/features/core/utils/validators.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';
import 'package:clean_architeture_flutter/features/domain/enum/type_remuneration_provider.enum.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/remuneration/controller/form_remuneration.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FormRemunerationPage extends StatefulHookConsumerWidget {
  final BuildContext parentContext;
  final Remuneration? remuneration;

  const FormRemunerationPage(
      {required this.parentContext, this.remuneration, super.key});

  @override
  _FormRemunerationPageState createState() => _FormRemunerationPageState();
}

class _FormRemunerationPageState extends ConsumerState<FormRemunerationPage> {
  final _key = GlobalKey<FormState>();
  final _provider = TextEditingController();
  final _value = TextEditingController();

  final typesProviders = TypeRemunerationProvider.values;

  onSubmit() {
    final bool isFormOkay = _key.currentState!.validate();
    if (isFormOkay) {
      widget.remuneration != null ? onEdit() : onCreate();
    }
  }

  void onCreate() async {
    final typeProvider = getTypeRemunerationSelected();

    final remuneration = Remuneration(
        provider: _provider.text,
        value: double.parse(_value.text),
        typeRemunerationProvider: typeProvider);

    await ref
        .read(formRemunerationStateProvider.notifier)
        .createRemuneration(remuneration);

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
    final typeProvider = getTypeRemunerationSelected();

    final monthlyForEdit = Remuneration(
        id: widget.remuneration!.id,
        provider: _provider.text,
        value: double.parse(_value.text),
        typeRemunerationProvider: typeProvider);

    await ref
        .read(formRemunerationStateProvider.notifier)
        .editRemuneration(monthlyForEdit);

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

  TypeRemunerationProvider getTypeRemunerationSelected() {
    final checkModel = ref.watch(formRemunerationStateProvider.notifier.select(
        // ignore: invalid_use_of_protected_member
        (value) => value.state.listaCheck!
            .firstWhere((element) => element.isSelect == true)));

    final typeProvider = TypeRemunerationProvider.values
        .firstWhere((element) => element.name == checkModel.name);
    return typeProvider;
  }

  void mountForm() {
    if (widget.remuneration != null) {
      _provider.text = widget.remuneration!.provider;
      _value.text = widget.remuneration!.value.toString();
      final index = TypeRemunerationProvider.values
          .firstWhere((element) =>
              element == widget.remuneration!.typeRemunerationProvider)
          .index;
      ref.watch(formRemunerationStateProvider.notifier).checkItem(index);
    }
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      mountForm();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(
        formRemunerationStateProvider.select((value) => value.isLoading));
    final listType = ref.watch(
        formRemunerationStateProvider.select((value) => value.listaCheck));

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
                height: MediaQuery.of(context).size.height * 0.70,
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
                          SizedBox(
                            height: 160,
                            child: GridView.count(
                              padding: EdgeInsets.zero,
                              crossAxisCount: 2,
                              childAspectRatio: 3,
                              children: List.generate(
                                typesProviders.length,
                                (index) => GestureDetector(
                                  onTap: () => ref
                                      .watch(formRemunerationStateProvider
                                          .notifier)
                                      .checkItem(index),
                                  child: CheckBoxComponent(
                                      checkBoxModel: listType![index]),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text("Nome do Provedor"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _provider,
                            validator: Validators.requiredWithFieldName(
                                'Nome do Provedor'),
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                hintText: 'Ex: TNG Shopping'),
                          ),
                          const SizedBox(height: 8),
                          const Text("Valor recebido"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _value,
                            validator: Validators.positiveNumberWithDot,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(hintText: 'Ex: 1320'),
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
