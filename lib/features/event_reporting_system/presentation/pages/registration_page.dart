

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/network_handler.dart';
import '../bloc/registration_bloc/registration_bloc.dart';
import '../bloc/registration_bloc/registration_validator.dart';
import '../dialogs/internet_connection_failure.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (_) => RegistrationBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Rejestracja'), brightness: Brightness.dark),
        resizeToAvoidBottomInset: false,
        body: Container(
            alignment: Alignment.center,
            child: FractionallySizedBox(
                widthFactor: 0.9, child: _registrationFormFields(context))),
      ),
    );
  }

  Widget _registrationFormFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 25.0),
            child: Text('Utwórz konto ')),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        _EmailField(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        _PasswordField(),
        //SizedBox(height: MediaQuery.of(context).size.height * 0.42),
        Spacer(),
        SizedBox(width: double.infinity, child: _SubmitButton())
        //Padding(padding: const EdgeInsets.only(bottom: 8.0), child: SizedBox(width: double.infinity, child: _SubmitButton()))
      ],
    );
  }
}

class _EmailFieldState extends State<_EmailField> {
  String _errMsgFromBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
        listenWhen: (previous, current) =>
            current is Error || (previous is! Error && current is UserChanged),
        listener: (context, state) {
          if (state is UserChanged) {
            _errMsgFromBloc = null;
          } else if (state is Error) {
            _errMsgFromBloc = state.message;
          }
        },
        buildWhen: (previous, current) =>
            ((previous.userModel?.email ?? false) !=
                (current.userModel?.email ?? false)),
        builder: (context, state) {
          return Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: _emailDecoration(state.userModel?.email ?? '', state),
              onChanged: (String value) => 
                context
                  .read<RegistrationBloc>()
                  .add(RegistrationEvent.emailChanged(email: value)),
            ),
          );
        });
  }

  InputDecoration _emailDecoration(String email, RegistrationState state) {
    return InputDecoration(
        labelText: 'E-mail',
        errorText: RegistrationValidator.emailValidator(
            email, _errMsgFromBloc, state));
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
    return BlocConsumer<RegistrationBloc, RegistrationState>(
        listenWhen: (previous, current) =>
            current is Error || (previous is! Error && current is UserChanged),
        listener: (context, state) {
          if (state is UserChanged) {
            _errMsgFromBloc = null;
          } else if (state is Error) {
            _errMsgFromBloc = state.message;
          }
        },
        buildWhen: (previous, current) =>
            ((previous.userModel?.password ?? false) !=
                (current.userModel?.password ?? false)),
        builder: (context, state) {
          return Container(
            child: TextField(
              obscureText: true,
              decoration:
                  _passwordDecoration(state.userModel?.password ?? '', state),
              onChanged: (String value) => context
                  .read<RegistrationBloc>()
                  .add(RegistrationEvent.passwordChanged(password: value)),
            ),
          );
        });
  }

  InputDecoration _passwordDecoration(
      String password, RegistrationState state) {
    return InputDecoration(
        labelText: 'Password',
        errorText: RegistrationValidator.passwordValidator(
            password, _errMsgFromBloc, state));
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

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) async {
          if (state is Error) {
            context
                .read<RegistrationBloc>()
                .add(RegistrationEvent.restorePreviouslyState());
          }
          if (state is SuccessRegister) Navigator.pop(context);
        },
        child: RaisedButton(
            child: Text('Zarejestruj się'),
            onPressed: () async {
              final isConnected = await NetworkHandlerImpl().isConnected();
              if (isConnected) {
                context
                    .read<RegistrationBloc>()
                    .add(RegistrationEvent.registrationSubmitted());
              } else {
                showDialog<void>(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return InternetConnectionFailureDialog('Zarejestrowanie się w naszym serwisie wymaga połączenia z internetem, spróbuj ponownie.')
                          .createDialog(context);
                    });
              }
            }));
  }
}
