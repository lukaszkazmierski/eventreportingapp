import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/status.dart';
import '../../../../../core/services/authentication_service.dart';
import '../../../data/models/user_model.dart';
import 'registration_event.dart';
import 'registration_state.dart';

export 'registration_event.dart';
export 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc()
      : _authenticationService = AuthenticationService(),
        super(RegistrationState.userInitial(userModel: UserModel.pure()));

  final AuthenticationService _authenticationService;
  var lastUserModelCopy = UserModel.pure();

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    yield* event.when(
        emailChanged: (e) => _mapEmailChangedToState(e, state),
        passwordChanged: (e) => _mapPasswordChangedToState(e, state),
        restorePreviouslyState: () => _mapRestorePreviouslyStateToState(),
        registrationSubmitted: () =>
            _mapRegistrationSubmittedToState(state));
  }

  Stream<RegistrationState> _mapEmailChangedToState(
      EmailChanged event, RegistrationState state) async* {
    yield RegistrationState.userChanged(
        userModel: state.userModel.copyWith(email: event.email));
  }

  Stream<RegistrationState> _mapPasswordChangedToState(
      PasswordChanged event, RegistrationState state) async* {
    yield RegistrationState.userChanged(
        userModel: state.userModel.copyWith(password: event.password));
  }

  Stream<RegistrationState> _mapRestorePreviouslyStateToState() async* {
    yield RegistrationState.userChanged(userModel: lastUserModelCopy);
  }

  Stream<RegistrationState> _mapRegistrationSubmittedToState(
      RegistrationState state) async* {
    try {
      var email = '';
      var password = '';
      if (state.userModel != null) {
        email = state.userModel.email;
        password = state.userModel.password;
      }
      
      var registrationResult = await _authenticationService
          .signUpWithEmailAndPassword(email, password);

      if (registrationResult.isLeft()) {
        var code;
        registrationResult.fold((l) => code = l.code, (r) => null);
        if (code != null) {
          var status = StatusCode.statusCodes[code];
          lastUserModelCopy = state.userModel;
          yield RegistrationState.error(message: status.message);
        }
      
      } else {
        yield RegistrationState.successRegister();
      }
    } on NetworkException {
      yield RegistrationState.error(
          message: 'Nie można się zarejestrować bez internetu');
    }
  }
}
