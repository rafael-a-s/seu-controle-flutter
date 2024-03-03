class AppRoutes {
  /// The Initial Page
  static const introLogin = '/intro_login';
  static const onboarding = '/onboarding';

  /* <---- Login, Signup -----> */
  static const auth = '/auth';
  static const login = '/login';
  static const signup = '/signup';
  static const loginOrSignup = '/loginOrSignup';
  static const forgotPassword = '/forgotPassword';
  static const passwordReset = '/passwordReset';

  /* <---- start -----> */
  static const start = '/start';

  /* <---- home -----> */
  static const home = '/home';

  /* <---- finance control -----> */
  static const financeControl = '$start/financeControl';

  /* <---- monthly contribution -----> */
  static const monthlyContribution = '$financeControl/monthlyContribution';

  /* <---- remuneration -----> */
  static const remuneration = '$financeControl/remuneration';

  /* <---- expense -----> */
  static const expense = '$financeControl/expense';

  /* <---- type expense -----> */
  static const typeExpense = '$financeControl/typeExpense';

  /* <---- Profile & Settings -----> */
  static const profile = '/profile';
}
