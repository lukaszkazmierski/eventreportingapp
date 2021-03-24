// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'registration_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent(this._type);

  factory RegistrationEvent.emailChanged({@required String email}) =
      EmailChanged.create;

  factory RegistrationEvent.passwordChanged({@required String password}) =
      PasswordChanged.create;

  factory RegistrationEvent.restorePreviouslyState() =
      RestorePreviouslyState.create;

  factory RegistrationEvent.registrationSubmitted() =
      RegistrationSubmitted.create;

  final _RegistrationEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _RegistrationEvent [_type]s defined.
  R when<R extends Object>(
      {@required R Function(EmailChanged) emailChanged,
      @required R Function(PasswordChanged) passwordChanged,
      @required R Function() restorePreviouslyState,
      @required R Function() registrationSubmitted}) {
    assert(() {
      if (emailChanged == null ||
          passwordChanged == null ||
          restorePreviouslyState == null ||
          registrationSubmitted == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _RegistrationEvent.EmailChanged:
        return emailChanged(this as EmailChanged);
      case _RegistrationEvent.PasswordChanged:
        return passwordChanged(this as PasswordChanged);
      case _RegistrationEvent.RestorePreviouslyState:
        return restorePreviouslyState();
      case _RegistrationEvent.RegistrationSubmitted:
        return registrationSubmitted();
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
      R Function() registrationSubmitted,
      @required R Function(RegistrationEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _RegistrationEvent.EmailChanged:
        if (emailChanged == null) break;
        return emailChanged(this as EmailChanged);
      case _RegistrationEvent.PasswordChanged:
        if (passwordChanged == null) break;
        return passwordChanged(this as PasswordChanged);
      case _RegistrationEvent.RestorePreviouslyState:
        if (restorePreviouslyState == null) break;
        return restorePreviouslyState();
      case _RegistrationEvent.RegistrationSubmitted:
        if (registrationSubmitted == null) break;
        return registrationSubmitted();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function(EmailChanged) emailChanged,
      void Function(PasswordChanged) passwordChanged,
      void Function() restorePreviouslyState,
      void Function() registrationSubmitted}) {
    assert(() {
      if (emailChanged == null &&
          passwordChanged == null &&
          restorePreviouslyState == null &&
          registrationSubmitted == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _RegistrationEvent.EmailChanged:
        if (emailChanged == null) break;
        return emailChanged(this as EmailChanged);
      case _RegistrationEvent.PasswordChanged:
        if (passwordChanged == null) break;
        return passwordChanged(this as PasswordChanged);
      case _RegistrationEvent.RestorePreviouslyState:
        if (restorePreviouslyState == null) break;
        return restorePreviouslyState();
      case _RegistrationEvent.RegistrationSubmitted:
        if (registrationSubmitted == null) break;
        return registrationSubmitted();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class EmailChanged extends RegistrationEvent {
  const EmailChanged({@required this.email})
      : super(_RegistrationEvent.EmailChanged);

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
abstract class PasswordChanged extends RegistrationEvent {
  const PasswordChanged({@required this.password})
      : super(_RegistrationEvent.PasswordChanged);

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
abstract class RestorePreviouslyState extends RegistrationEvent {
  const RestorePreviouslyState()
      : super(_RegistrationEvent.RestorePreviouslyState);

  factory RestorePreviouslyState.create() = _RestorePreviouslyStateImpl;
}

@immutable
class _RestorePreviouslyStateImpl extends RestorePreviouslyState {
  const _RestorePreviouslyStateImpl() : super();

  @override
  String toString() => 'RestorePreviouslyState()';
}

@immutable
abstract class RegistrationSubmitted extends RegistrationEvent {
  const RegistrationSubmitted()
      : super(_RegistrationEvent.RegistrationSubmitted);

  factory RegistrationSubmitted.create() = _RegistrationSubmittedImpl;
}

@immutable
class _RegistrationSubmittedImpl extends RegistrationSubmitted {
  const _RegistrationSubmittedImpl() : super();

  @override
  String toString() => 'RegistrationSubmitted()';
}
