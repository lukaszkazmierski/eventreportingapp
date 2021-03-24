// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'login_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent(this._type);

  factory LoginEvent.emailChanged({@required String email}) =
      EmailChanged.create;

  factory LoginEvent.passwordChanged({@required String password}) =
      PasswordChanged.create;

  factory LoginEvent.restorePreviouslyState() = RestorePreviouslyState.create;

  factory LoginEvent.logInSubmitted() = LogInSubmitted.create;

  factory LoginEvent.continueAnonymously() = ContinueAnonymously.create;

  final _LoginEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _LoginEvent [_type]s defined.
  R when<R extends Object>(
      {@required R Function(EmailChanged) emailChanged,
      @required R Function(PasswordChanged) passwordChanged,
      @required R Function() restorePreviouslyState,
      @required R Function() logInSubmitted,
      @required R Function() continueAnonymously}) {
    assert(() {
      if (emailChanged == null ||
          passwordChanged == null ||
          restorePreviouslyState == null ||
          logInSubmitted == null ||
          continueAnonymously == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginEvent.EmailChanged:
        return emailChanged(this as EmailChanged);
      case _LoginEvent.PasswordChanged:
        return passwordChanged(this as PasswordChanged);
      case _LoginEvent.RestorePreviouslyState:
        return restorePreviouslyState();
      case _LoginEvent.LogInSubmitted:
        return logInSubmitted();
      case _LoginEvent.ContinueAnonymously:
        return continueAnonymously();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function(EmailChanged) emailChanged,
      R Function(PasswordChanged) passwordChanged,
      R Function() restorePreviouslyState,
      R Function() logInSubmitted,
      R Function() continueAnonymously,
      @required R Function(LoginEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginEvent.EmailChanged:
        if (emailChanged == null) break;
        return emailChanged(this as EmailChanged);
      case _LoginEvent.PasswordChanged:
        if (passwordChanged == null) break;
        return passwordChanged(this as PasswordChanged);
      case _LoginEvent.RestorePreviouslyState:
        if (restorePreviouslyState == null) break;
        return restorePreviouslyState();
      case _LoginEvent.LogInSubmitted:
        if (logInSubmitted == null) break;
        return logInSubmitted();
      case _LoginEvent.ContinueAnonymously:
        if (continueAnonymously == null) break;
        return continueAnonymously();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function(EmailChanged) emailChanged,
      void Function(PasswordChanged) passwordChanged,
      void Function() restorePreviouslyState,
      void Function() logInSubmitted,
      void Function() continueAnonymously}) {
    assert(() {
      if (emailChanged == null &&
          passwordChanged == null &&
          restorePreviouslyState == null &&
          logInSubmitted == null &&
          continueAnonymously == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginEvent.EmailChanged:
        if (emailChanged == null) break;
        return emailChanged(this as EmailChanged);
      case _LoginEvent.PasswordChanged:
        if (passwordChanged == null) break;
        return passwordChanged(this as PasswordChanged);
      case _LoginEvent.RestorePreviouslyState:
        if (restorePreviouslyState == null) break;
        return restorePreviouslyState();
      case _LoginEvent.LogInSubmitted:
        if (logInSubmitted == null) break;
        return logInSubmitted();
      case _LoginEvent.ContinueAnonymously:
        if (continueAnonymously == null) break;
        return continueAnonymously();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class EmailChanged extends LoginEvent {
  const EmailChanged({@required this.email}) : super(_LoginEvent.EmailChanged);

  factory EmailChanged.create({@required String email}) = _EmailChangedImpl;

  final String email;

  /// Creates a copy of this EmailChanged but with the given fields
  /// replaced with the new values.
  EmailChanged copyWith({String email});
}

@immutable
class _EmailChangedImpl extends EmailChanged {
  const _EmailChangedImpl({@required this.email}) : super(email: email);

  @override
  final String email;

  @override
  _EmailChangedImpl copyWith({Object email = superEnum}) => _EmailChangedImpl(
        email: email == superEnum ? this.email : email as String,
      );
  @override
  String toString() => 'EmailChanged(email: ${this.email})';
  @override
  List<Object> get props => [email];
}

@immutable
abstract class PasswordChanged extends LoginEvent {
  const PasswordChanged({@required this.password})
      : super(_LoginEvent.PasswordChanged);

  factory PasswordChanged.create({@required String password}) =
      _PasswordChangedImpl;

  final String password;

  /// Creates a copy of this PasswordChanged but with the given fields
  /// replaced with the new values.
  PasswordChanged copyWith({String password});
}

@immutable
class _PasswordChangedImpl extends PasswordChanged {
  const _PasswordChangedImpl({@required this.password})
      : super(password: password);

  @override
  final String password;

  @override
  _PasswordChangedImpl copyWith({Object password = superEnum}) =>
      _PasswordChangedImpl(
        password: password == superEnum ? this.password : password as String,
      );
  @override
  String toString() => 'PasswordChanged(password: ${this.password})';
  @override
  List<Object> get props => [password];
}

@immutable
abstract class RestorePreviouslyState extends LoginEvent {
  const RestorePreviouslyState() : super(_LoginEvent.RestorePreviouslyState);

  factory RestorePreviouslyState.create() = _RestorePreviouslyStateImpl;
}

@immutable
class _RestorePreviouslyStateImpl extends RestorePreviouslyState {
  const _RestorePreviouslyStateImpl() : super();

  @override
  String toString() => 'RestorePreviouslyState()';
}

@immutable
abstract class LogInSubmitted extends LoginEvent {
  const LogInSubmitted() : super(_LoginEvent.LogInSubmitted);

  factory LogInSubmitted.create() = _LogInSubmittedImpl;
}

@immutable
class _LogInSubmittedImpl extends LogInSubmitted {
  const _LogInSubmittedImpl() : super();

  @override
  String toString() => 'LogInSubmitted()';
}

@immutable
abstract class ContinueAnonymously extends LoginEvent {
  const ContinueAnonymously() : super(_LoginEvent.ContinueAnonymously);

  factory ContinueAnonymously.create() = _ContinueAnonymouslyImpl;
}

@immutable
class _ContinueAnonymouslyImpl extends ContinueAnonymously {
  const _ContinueAnonymouslyImpl() : super();

  @override
  String toString() => 'ContinueAnonymously()';
}
