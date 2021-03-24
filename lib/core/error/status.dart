import 'status_codes.dart';

class StatusDetails {
  final String name;
  final String message;

  StatusDetails({this.name, this.message});
}


final _LoginStatus = {
  LoginStatusCode.unknown: StatusDetails(name: 'unknown', message: 'Podane dane są puste lub nieprzypisane'),
  LoginStatusCode.userNotFound: StatusDetails(name: 'user-not-found', message: 'Podany przez Ciebie adres e-mail nie jest zarejestrowany'),
  LoginStatusCode.wrongPassword: StatusDetails(name: 'wrong-password', message: 'Nieprawidłowe hasło'),
  LoginStatusCode.invalidEmail: StatusDetails(name: 'invalid-email', message: 'Nieprawidłowy adres e-mail'),
};


final _RegisterStatus = {
  RegisterStatusCode.unknown: StatusDetails(
    name: 'unknown',
    message: 'Podane dane są puste lub nieprzypisane'
  ),
  RegisterStatusCode.weakPassword: StatusDetails(
      name: 'weak-password',
      message:
          'Hasło musi zawierać min. 6 znaków w tym małą i wielką literę, cyfrę i znak specjalny'),
  RegisterStatusCode.emailAlreadyInUser: StatusDetails(name: 'email-already-in-use', message: 'Podany przez Ciebie adres e-mail jest aktualnie zarejestrowany w naszym serwisie'),
  RegisterStatusCode.invalidEmail: StatusDetails(name: 'invalid-email', message: 'Podaj prawidłowy adres e-mail')
};


class StatusCode {
  static final statusCodes = {
    ..._LoginStatus,
    ..._RegisterStatus
  };
}
