// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'registration_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class RegistrationState extends Equatable {
  final UserModel userModel;

  const RegistrationState(this._type, this.userModel);

  factory RegistrationState.userInitial({@required UserModel userModel}) =
      UserInitial.create;

  factory RegistrationState.userChanged({@required UserModel userModel}) =
      UserChanged.create;

  factory RegistrationState.successRegister() = SuccessRegister.create;

  factory RegistrationState.error({@required String message}) = Error.create;

  final _RegistrationState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _RegistrationState [_type]s defined.
  R when<R extends Object>(
      {@required R Function(UserInitial) userInitial,
      @required R Function(UserChanged) userChanged,
      @required R Function() successRegister,
      @required R Function(Error) error}) {
    assert(() {
      if (userInitial == null ||
          userChanged == null ||
          successRegister == null ||
          error == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _RegistrationState.UserInitial:
        return userInitial(this as UserInitial);
      case _RegistrationState.UserChanged:
        return userChanged(this as UserChanged);
      case _RegistrationState.SuccessRegister:
        return successRegister();
      case _RegistrationState.Error:
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
      R Function() successRegister,
      R Function(Error) error,
      @required R Function(RegistrationState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _RegistrationState.UserInitial:
        if (userInitial == null) break;
        return userInitial(this as UserInitial);
      case _RegistrationState.UserChanged:
        if (userChanged == null) break;
        return userChanged(this as UserChanged);
      case _RegistrationState.SuccessRegister:
        if (successRegister == null) break;
        return successRegister();
      case _RegistrationState.Error:
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
      void Function() successRegister,
      void Function(Error) error}) {
    assert(() {
      if (userInitial == null &&
          userChanged == null &&
          successRegister == null &&
          error == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _RegistrationState.UserInitial:
        if (userInitial == null) break;
        return userInitial(this as UserInitial);
      case _RegistrationState.UserChanged:
        if (userChanged == null) break;
        return userChanged(this as UserChanged);
      case _RegistrationState.SuccessRegister:
        if (successRegister == null) break;
        return successRegister();
      case _RegistrationState.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class UserInitial extends RegistrationState {
  const UserInitial({@required this.userModel})
      : super(_RegistrationState.UserInitial, userModel);

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
abstract class UserChanged extends RegistrationState {
  const UserChanged({@required this.userModel})
      : super(_RegistrationState.UserChanged, userModel);

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
abstract class SuccessRegister extends RegistrationState {
  const SuccessRegister() : super(_RegistrationState.SuccessRegister, null);

  factory SuccessRegister.create() = _SuccessRegisterImpl;
}

@immutable
class _SuccessRegisterImpl extends SuccessRegister {
  const _SuccessRegisterImpl() : super();

  @override
  String toString() => 'SuccessRegister()';
}

@immutable
abstract class Error extends RegistrationState {
  const Error({@required this.message}) : super(_RegistrationState.Error, null);

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
