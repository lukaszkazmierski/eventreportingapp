import 'registration_bloc.dart';

class RegistrationValidator {
  static RegExp _emailExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  static RegExp _passwordExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  static String emailValidator(
      String email, String errMsgFromBloc, RegistrationState state) {
    if (errMsgFromBloc != null) {
      if (!errMsgFromBloc.contains('puste')) if (!errMsgFromBloc.contains('Hasło'))
        return errMsgFromBloc;
    }

    if (_emailExp.hasMatch(email) && email.isNotEmpty || state is UserInitial) {
      return null;
    }
    return 'Podaj prawidłowy adres e-mail';
  }

  static String passwordValidator(String password, String errMsgFromBloc, RegistrationState state) {
    if (errMsgFromBloc != null) {
      if (!errMsgFromBloc.contains('puste'))
      if (!errMsgFromBloc.contains('e-mail'))
        return errMsgFromBloc;
    }

    if (_passwordExp.hasMatch(password) && password.isNotEmpty ||
        state is UserInitial) {
      return null;
    }
    return 'Hasło musi zawierać min. 6 znaków w tym małą i wielką literę, cyfrę i znak specjalny';
  }
}
