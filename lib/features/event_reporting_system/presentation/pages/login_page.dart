import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/network/network_handler.dart';
import '../../../../core/routes/paths.dart';
import '../../../../core/styles/global_colors.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/login_event.dart';
import '../dialogs/internet_connection_failure.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logowanie'), brightness: Brightness.dark),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (_) => LoginBloc(),
        child: Container(
            alignment: Alignment.center,
            child: FractionallySizedBox(
                widthFactor: 0.9, child: _loginFormFields(context))),
      ),
    );
  }

  Widget _loginFormFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 25.0),
            child: Text('Zaloguj się do zgłaszania zdarzeń')),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        _EmailField(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        _PasswordField(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Row(
          children: [
            _SignUp(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.21,
            ),
            //_ForgotPassword()
          ],
        ),
        Spacer(),
        Row(
          children: [
            _AnonymouslyLogIn(),
            SizedBox(width: MediaQuery.of(context).size.width * 0.035),
            _LogInBtn(),
          ],
        ),
      ],
    );
  }
}

class _EmailFieldState extends State<_EmailField> {
  String _errMsgFromBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          current is Error || (previous is! Error && current is UserChanged),
      listener: (context, state) {
        if (state is UserChanged) {
          _errMsgFromBloc = null;
        } else if (state is Error) {
          if (state.message.contains('puste')) {
            _errMsgFromBloc = 'Podaj prawidłowy adres e-mail';
          } else if (state.message.contains('e-mail')) {
            _errMsgFromBloc = state.message;
          }
        }
      },
      buildWhen: (previous, current) => ((previous.userModel?.email ?? false) !=
          (current.userModel?.email ?? false)),
      builder: (context, state) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Adres E-mail', errorText: _errMsgFromBloc),
          onChanged: (String value) => context
              .read<LoginBloc>()
              .add(LoginEvent.emailChanged(email: value)),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _EmailField extends StatefulWidget {
  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  String _errMsgFromBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          current is Error || (previous is! Error && current is UserChanged),
      listener: (context, state) {
        if (state is UserChanged) {
          _errMsgFromBloc = null;
        } else if (state is Error) {
          if (state.message.contains('puste')) {
            _errMsgFromBloc = 'Pole z hasłem nie może być puste';
          } else if (state.message.contains('hasło'))
            _errMsgFromBloc = state.message;
        }
      },
      buildWhen: (previous, current) =>
          ((previous.userModel?.password ?? false) !=
              (current.userModel?.password ?? false)),
      builder: (context, state) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Password', errorText: _errMsgFromBloc),
          onChanged: (String value) => context
              .read<LoginBloc>()
              .add(LoginEvent.passwordChanged(password: value)),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _SignUp extends StatelessWidget {
  final _settingsBox = Hive.box('settings');

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Text('Nie masz jeszcze konta?', style: TextStyle(fontSize: 14)),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, Path.registration),
        child: Text('Zarejestruj się',
            style: TextStyle(
                color: _settingsBox.get('darkMode') == true
                    ? GlobalColors.actionLinksForDark
                    : GlobalColors.actionLinksForLight,
                fontSize: 14)),
      )
    ]));
  }
}

class _LogInBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is Error) {
          context.read<LoginBloc>().add(LoginEvent.restorePreviouslyState());
        }
        if (state is SuccessLogin)
          Navigator.pushReplacementNamed(context, Path.home);
      },
      child: Expanded(
          child: RaisedButton(
        onPressed: () async {
          final isConnected = await NetworkHandlerImpl().isConnected();
          if (isConnected) {
            context.read<LoginBloc>().add(LoginEvent.logInSubmitted());
          } else {
            showDialog<void>(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return InternetConnectionFailureDialog(
                          'Zalogowanie się na swoje konto wymaga połączenia z internetem, spróbuj ponownie.')
                      .createDialog(context);
                });
                
          }
          
          
        },
        child: Text('Zaloguj się'),
      )),
    );
  }
}

class _AnonymouslyLogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RaisedButton(
      onPressed: () {
        context.read<LoginBloc>().add(LoginEvent.continueAnonymously());
        Navigator.pushReplacementNamed(context, Path.home);
      },
      child: Text('Kontynuuj Anonimowo'),
    ));
  }
}
