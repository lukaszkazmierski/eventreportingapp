// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'login_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class LoginState extends Equatable {
  final UserModel userModel;

  const LoginState(this._type, this.userModel);

  factory LoginState.userInitial({@required UserModel userModel}) =
      UserInitial.create;

  factory LoginState.userChanged({@required UserModel userModel}) =
      UserChanged.create;

  factory LoginState.successLogin() = SuccessLogin.create;

  factory LoginState.error({@required String message}) = Error.create;

  final _LoginState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _LoginState [_type]s defined.
  R when<R extends Object>(
      {@required R Function(UserInitial) userInitial,
      @required R Function(UserChanged) userChanged,
      @required R Function() successLogin,
      @required R Function(Error) error}) {
    assert(() {
      if (userInitial == null ||
          userChanged == null ||
          successLogin == null ||
          error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginState.UserInitial:
        return userInitial(this as UserInitial);
      case _LoginState.UserChanged:
        return userChanged(this as UserChanged);
      case _LoginState.SuccessLogin:
        return successLogin();
      case _LoginState.Error:
        return error(this as Error);
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function(UserInitial) userInitial,
      R Function(UserChanged) userChanged,
      R Function() successLogin,
      R Function(Error) error,
      @required R Function(LoginState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginState.UserInitial:
        if (userInitial == null) break;
        return userInitial(this as UserInitial);
      case _LoginState.UserChanged:
        if (userChanged == null) break;
        return userChanged(this as UserChanged);
      case _LoginState.SuccessLogin:
        if (successLogin == null) break;
        return successLogin();
      case _LoginState.Error:
        if (error == null) break;
        return error(this as Error);
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function(UserInitial) userInitial,
      void Function(UserChanged) userChanged,
      void Function() successLogin,
      void Function(Error) error}) {
    assert(() {
      if (userInitial == null &&
          userChanged == null &&
          successLogin == null &&
          error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _LoginState.UserInitial:
        if (userInitial == null) break;
        return userInitial(this as UserInitial);
      case _LoginState.UserChanged:
        if (userChanged == null) break;
        return userChanged(this as UserChanged);
      case _LoginState.SuccessLogin:
        if (successLogin == null) break;
        return successLogin();
      case _LoginState.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class UserInitial extends LoginState {
  const UserInitial({@required this.userModel})
      : super(_LoginState.UserInitial, userModel);

  factory UserInitial.create({@required UserModel userModel}) =
      _UserInitialImpl;

  final UserModel userModel;

  /// Creates a copy of this UserInitial but with the given fields
  /// replaced with the new values.
  UserInitial copyWith({UserModel userModel});
}

@immutable
class _UserInitialImpl extends UserInitial {
  const _UserInitialImpl({@required this.userModel})
      : super(userModel: userModel);

  @override
  final UserModel userModel;

  @override
  _UserInitialImpl copyWith({Object userModel = superEnum}) => _UserInitialImpl(
        userModel:
            userModel == superEnum ? this.userModel : userModel as UserModel,
      );
  @override
  String toString() => 'UserInitial(userModel: ${this.userModel})';
  @override
  List<Object> get props => [userModel];
}

@immutable
abstract class UserChanged extends LoginState {
  const UserChanged({@required this.userModel})
      : super(_LoginState.UserChanged, userModel);

  factory UserChanged.create({@required UserModel userModel}) =
      _UserChangedImpl;

  final UserModel userModel;

  /// Creates a copy of this UserChanged but with the given fields
  /// replaced with the new values.
  UserChanged copyWith({UserModel userModel});
}

@immutable
class _UserChangedImpl extends UserChanged {
  const _UserChangedImpl({@required this.userModel})
      : super(userModel: userModel);

  @override
  final UserModel userModel;

  @override
  _UserChangedImpl copyWith({Object userModel = superEnum}) => _UserChangedImpl(
        userModel:
            userModel == superEnum ? this.userModel : userModel as UserModel,
      );
  @override
  String toString() => 'UserChanged(userModel: ${this.userModel})';
  @override
  List<Object> get props => [userModel];
}

@immutable
abstract class SuccessLogin extends LoginState {
  const SuccessLogin() : super(_LoginState.SuccessLogin, null);

  factory SuccessLogin.create() = _SuccessLoginImpl;
}

@immutable
class _SuccessLoginImpl extends SuccessLogin {
  const _SuccessLoginImpl() : super();

  @override
  String toString() => 'SuccessLogin()';
}

@immutable
abstract class Error extends LoginState {
  const Error({@required this.message}) : super(_LoginState.Error, null);

  factory Error.create({@required String message}) = _ErrorImpl;

  final String message;

  /// Creates a copy of this Error but with the given fields
  /// replaced with the new values.
  Error copyWith({String message});
}

@immutable
class _ErrorImpl extends Error {
  const _ErrorImpl({@required this.message}) : super(message: message);

  @override
  final String message;

  @override
  _ErrorImpl copyWith({Object message = superEnum}) => _ErrorImpl(
        message: message == superEnum ? this.message : message as String,
      );
  @override
  String toString() => 'Error(message: ${this.message})';
  @override
  List<Object> get props => [message];
}
