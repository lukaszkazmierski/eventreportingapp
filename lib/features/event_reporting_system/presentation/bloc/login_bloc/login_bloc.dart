import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/status.dart';
import '../../../../../core/services/authentication_service.dart';
import '../../../data/models/user_model.dart';
import 'login_event.dart';
import 'login_state.dart';

export 'package:eventreportingsystem/features/event_reporting_system/data/models/user_model.dart';

export './login_event.dart';
export './login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : 
    _authenticationService = AuthenticationService(),
    super(LoginState.userInitial(userModel: UserModel.pure()));

  final AuthenticationService _authenticationService;
  var lastUserModelCopy = UserModel.pure();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield* event.when(
      emailChanged: (e) => _mapEmailChangedToState(e), 
      passwordChanged: (e) => _mapPasswordChangedToState(e), 
      restorePreviouslyState: () => _mapRestorePreviouslyStateToState(),
      logInSubmitted: () => _mapLogInSubmittedToState(), 
      continueAnonymously: () => _mapContinueAnonymouslyToState()
    );
  }

  Stream<LoginState> _mapEmailChangedToState(EmailChanged event) async* { 
    yield LoginState.userChanged(userModel: state.userModel.copyWith(email: event.email));
  }

  Stream<LoginState> _mapPasswordChangedToState(PasswordChanged event) async* {
    yield LoginState.userChanged(userModel: state.userModel.copyWith(password: event.password));
  }

  Stream<LoginState> _mapRestorePreviouslyStateToState() async* {
    yield LoginState.userChanged(userModel: lastUserModelCopy);
  }

  Stream<LoginState> _mapLogInSubmittedToState() async* {
    try {
      var email = '';
      var password = '';
      if (state.userModel != null) {
        email = state.userModel.email;
        password = state.userModel.password;
      }
      
      var loginResult = await _authenticationService.logInWithEmailAndPassword(email, password);

      if (loginResult.isLeft()) {
        var code;
        loginResult.fold((l) => code = l.code, (r) => null);
        if (code != null) {
          var status = StatusCode.statusCodes[code];
          lastUserModelCopy = state.userModel;
          yield LoginState.error(message: status.message);
        }
      
      } else {
        yield LoginState.successLogin();
      }
    } on NetworkException {
      yield LoginState.error(message: 'Nie można zalogować się bez internetu');
    } 
  }

  Stream<LoginState> _mapContinueAnonymouslyToState() async* {
    try {
      await _authenticationService.signInAnonymously();
    } on NetworkException {
      yield LoginState.error(message: 'Nie mozna sie zalogowac bez internetu');
    }
  }
}

