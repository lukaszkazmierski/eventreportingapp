// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'report_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ReportState extends Equatable {
  final CrimeReport crimeReport;

  const ReportState(this._type, this.crimeReport);

  factory ReportState.reportInitial({@required CrimeReport crimeReport}) =
      ReportInitial.create;

  factory ReportState.reportChanged({@required CrimeReport crimeReport}) =
      ReportChanged.create;

  factory ReportState.success() = Success.create;

  factory ReportState.photoError() = PhotoError.create;

  factory ReportState.networkError() = NetworkError.create;

  final _ReportState _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _ReportState [_type]s defined.
  R when<R extends Object>(
      {@required R Function(ReportInitial) reportInitial,
      @required R Function(ReportChanged) reportChanged,
      @required R Function() success,
      @required R Function() photoError,
      @required R Function() networkError}) {
    assert(() {
      if (reportInitial == null ||
          reportChanged == null ||
          success == null ||
          photoError == null ||
          networkError == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ReportState.ReportInitial:
        return reportInitial(this as ReportInitial);
      case _ReportState.ReportChanged:
        return reportChanged(this as ReportChanged);
      case _ReportState.Success:
        return success();
      case _ReportState.PhotoError:
        return photoError();
      case _ReportState.NetworkError:
        return networkError();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function(ReportInitial) reportInitial,
      R Function(ReportChanged) reportChanged,
      R Function() success,
      R Function() photoError,
      R Function() networkError,
      @required R Function(ReportState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ReportState.ReportInitial:
        if (reportInitial == null) break;
        return reportInitial(this as ReportInitial);
      case _ReportState.ReportChanged:
        if (reportChanged == null) break;
        return reportChanged(this as ReportChanged);
      case _ReportState.Success:
        if (success == null) break;
        return success();
      case _ReportState.PhotoError:
        if (photoError == null) break;
        return photoError();
      case _ReportState.NetworkError:
        if (networkError == null) break;
        return networkError();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function(ReportInitial) reportInitial,
      void Function(ReportChanged) reportChanged,
      void Function() success,
      void Function() photoError,
      void Function() networkError}) {
    assert(() {
      if (reportInitial == null &&
          reportChanged == null &&
          success == null &&
          photoError == null &&
          networkError == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _ReportState.ReportInitial:
        if (reportInitial == null) break;
        return reportInitial(this as ReportInitial);
      case _ReportState.ReportChanged:
        if (reportChanged == null) break;
        return reportChanged(this as ReportChanged);
      case _ReportState.Success:
        if (success == null) break;
        return success();
      case _ReportState.PhotoError:
        if (photoError == null) break;
        return photoError();
      case _ReportState.NetworkError:
        if (networkError == null) break;
        return networkError();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class ReportInitial extends ReportState {
  const ReportInitial({@required this.crimeReport})
      : super(_ReportState.ReportInitial, crimeReport);

  factory ReportInitial.create({@required CrimeReport crimeReport}) =
      _ReportInitialImpl;

  final CrimeReport crimeReport;

  /// Creates a copy of this ReportInitial but with the given fields
  /// replaced with the new values.
  ReportInitial copyWith({CrimeReport crimeReport});
}

@immutable
class _ReportInitialImpl extends ReportInitial {
  const _ReportInitialImpl({@required this.crimeReport})
      : super(crimeReport: crimeReport);

  @override
  final CrimeReport crimeReport;

  @override
  _ReportInitialImpl copyWith({Object crimeReport = superEnum}) =>
      _ReportInitialImpl(
        crimeReport: crimeReport == superEnum
            ? this.crimeReport
            : crimeReport as CrimeReport,
      );
  @override
  String toString() => 'ReportInitial(crimeReport: ${this.crimeReport})';
  @override
  List<Object> get props => [crimeReport];
}

@immutable
abstract class ReportChanged extends ReportState {
  const ReportChanged({@required this.crimeReport})
      : super(_ReportState.ReportChanged, crimeReport);

  factory ReportChanged.create({@required CrimeReport crimeReport}) =
      _ReportChangedImpl;

  final CrimeReport crimeReport;

  /// Creates a copy of this ReportChanged but with the given fields
  /// replaced with the new values.
  ReportChanged copyWith({CrimeReport crimeReport});
}

@immutable
class _ReportChangedImpl extends ReportChanged {
  const _ReportChangedImpl({@required this.crimeReport})
      : super(crimeReport: crimeReport);

  @override
  final CrimeReport crimeReport;

  @override
  _ReportChangedImpl copyWith({Object crimeReport = superEnum}) =>
      _ReportChangedImpl(
        crimeReport: crimeReport == superEnum
            ? this.crimeReport
            : crimeReport as CrimeReport,
      );
  @override
  String toString() => 'ReportChanged(crimeReport: ${this.crimeReport})';
  @override
  List<Object> get props => [crimeReport];
}

@immutable
abstract class Success extends ReportState {
  const Success() : super(_ReportState.Success, null);

  factory Success.create() = _SuccessImpl;
}

@immutable
class _SuccessImpl extends Success {
  const _SuccessImpl() : super();

  @override
  String toString() => 'Success()';
}

@immutable
abstract class PhotoError extends ReportState {
  const PhotoError() : super(_ReportState.PhotoError, null);

  factory PhotoError.create() = _PhotoErrorImpl;
}

@immutable
class _PhotoErrorImpl extends PhotoError {
  const _PhotoErrorImpl() : super();

  @override
  String toString() => 'PhotoError()';
}

@immutable
abstract class NetworkError extends ReportState {
  const NetworkError() : super(_ReportState.NetworkError, null);

  factory NetworkError.create() = _NetworkErrorImpl;
}

@immutable
class _NetworkErrorImpl extends NetworkError {
  const _NetworkErrorImpl() : super();

  @override
  String toString() => 'NetworkError()';
}
