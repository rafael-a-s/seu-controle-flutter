import 'package:clean_architeture_flutter/features/core/constants/constants.dart';

import 'onboarding_model.dart';

class OnboardingData {
  static List<OnboardingModel> items = [
    OnboardingModel(
      imageUrl: AppImages.onboarding1,
      headline: 'Crie seu perfil financeiro',
      description:
          'Coloque seus gastos fixos e variáveis, para ter controle mensal e não terminar o mês devendo.',
    ),
    OnboardingModel(
      imageUrl: AppImages.onboarding2,
      headline: 'Saiba quanto você poderá gastar por semana.',
      description:
          'Tenha em mente o quanto vecê deve gastar por semana, para ter alívio no final do mês e gaste despreocupado.',
    ),
    OnboardingModel(
      imageUrl: AppImages.onboarding3,
      headline: 'Crie seu perfil em 15 minutos',
      description:
          'Cadastre seus gastos, perca o medo de enfrentá-los e gaste sem medo.',
    ),
  ];
}
