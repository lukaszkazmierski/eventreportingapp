// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: return_of_invalid_type, constant_identifier_names, prefer_const_constructors_in_immutables, unnecessary_this, sort_unnamed_constructors_first, join_return_with_assignment, missing_return, lines_longer_than_80_chars

part of 'report_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ReportEvent extends Equatable {
  const ReportEvent(this._type);

  factory ReportEvent.descriptionChanged({@required String description}) =
      DescriptionChanged.create;

  factory ReportEvent.categoryChanged({@required String category}) =
      CategoryChanged.create;

  factory ReportEvent.getPosition() = GetPosition.create;

  factory ReportEvent.pickCamera() = PickCamera.create;

  factory ReportEvent.pickImage() = PickImage.create;

  factory ReportEvent.restorePreviouslyState() = RestorePreviouslyState.create;

  factory ReportEvent.reportSent() = ReportSent.create;

  final _ReportEvent _type;

  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the _ReportEvent [_type]s defined.
  R when<R extends Object>(
      {@required R Function(DescriptionChanged) descriptionChanged,
      @required R Function(CategoryChanged) categoryChanged,
      @required R Function() getPosition,
      @required R Function() pickCamera,
      @required R Function() pickImage,
      @required R Function() restorePreviouslyState,
      @required R Function() reportSent}) {
    assert(() {
      if (descriptionChanged == null ||
          categoryChanged == null ||
          getPosition == null ||
          pickCamera == null ||
          pickImage == null ||
          restorePreviouslyState == null ||
          reportSent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ReportEvent.DescriptionChanged:
        return descriptionChanged(this as DescriptionChanged);
      case _ReportEvent.CategoryChanged:
        return categoryChanged(this as CategoryChanged);
      case _ReportEvent.GetPosition:
        return getPosition();
      case _ReportEvent.PickCamera:
        return pickCamera();
      case _ReportEvent.PickImage:
        return pickImage();
      case _ReportEvent.RestorePreviouslyState:
        return restorePreviouslyState();
      case _ReportEvent.ReportSent:
        return reportSent();
    }
  }

  /// The [whenOrElse] method is equivalent to [when], but doesn't require
  /// all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra orElse required parameter,
  /// for fallback behavior.
  R whenOrElse<R extends Object>(
      {R Function(DescriptionChanged) descriptionChanged,
      R Function(CategoryChanged) categoryChanged,
      R Function() getPosition,
      R Function() pickCamera,
      R Function() pickImage,
      R Function() restorePreviouslyState,
      R Function() reportSent,
      @required R Function(ReportEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ReportEvent.DescriptionChanged:
        if (descriptionChanged == null) break;
        return descriptionChanged(this as DescriptionChanged);
      case _ReportEvent.CategoryChanged:
        if (categoryChanged == null) break;
        return categoryChanged(this as CategoryChanged);
      case _ReportEvent.GetPosition:
        if (getPosition == null) break;
        return getPosition();
      case _ReportEvent.PickCamera:
        if (pickCamera == null) break;
        return pickCamera();
      case _ReportEvent.PickImage:
        if (pickImage == null) break;
        return pickImage();
      case _ReportEvent.RestorePreviouslyState:
        if (restorePreviouslyState == null) break;
        return restorePreviouslyState();
      case _ReportEvent.ReportSent:
        if (reportSent == null) break;
        return reportSent();
    }
    return orElse(this);
  }

  /// The [whenPartial] method is equivalent to [whenOrElse],
  /// but non-exhaustive.
  void whenPartial(
      {void Function(DescriptionChanged) descriptionChanged,
      void Function(CategoryChanged) categoryChanged,
      void Function() getPosition,
      void Function() pickCamera,
      void Function() pickImage,
      void Function() restorePreviouslyState,
      void Function() reportSent}) {
    assert(() {
      if (descriptionChanged == null &&
          categoryChanged == null &&
          getPosition == null &&
          pickCamera == null &&
          pickImage == null &&
          restorePreviouslyState == null &&
          reportSent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _ReportEvent.DescriptionChanged:
        if (descriptionChanged == null) break;
        return descriptionChanged(this as DescriptionChanged);
      case _ReportEvent.CategoryChanged:
        if (categoryChanged == null) break;
        return categoryChanged(this as CategoryChanged);
      case _ReportEvent.GetPosition:
        if (getPosition == null) break;
        return getPosition();
      case _ReportEvent.PickCamera:
        if (pickCamera == null) break;
        return pickCamera();
      case _ReportEvent.PickImage:
        if (pickImage == null) break;
        return pickImage();
      case _ReportEvent.RestorePreviouslyState:
        if (restorePreviouslyState == null) break;
        return restorePreviouslyState();
      case _ReportEvent.ReportSent:
        if (reportSent == null) break;
        return reportSent();
    }
  }

  @override
  List<Object> get props => const [];
}

@immutable
abstract class DescriptionChanged extends ReportEvent {
  const DescriptionChanged({@required this.description})
      : super(_ReportEvent.DescriptionChanged);

  factory DescriptionChanged.create({@required String description}) =
      _DescriptionChangedImpl;

  final String description;

  /// Creates a copy of this DescriptionChanged but with the given fields
  /// replaced with the new values.
  DescriptionChanged copyWith({String description});
}

@immutable
class _DescriptionChangedImpl extends DescriptionChanged {
  const _DescriptionChangedImpl({@required this.description})
      : super(description: description);

  @override
  final String description;

  @override
  _DescriptionChangedImpl copyWith({Object description = superEnum}) =>
      _DescriptionChangedImpl(
        description:
            description == superEnum ? this.description : description as String,
      );
  @override
  String toString() => 'DescriptionChanged(description: ${this.description})';
  @override
  List<Object> get props => [description];
}

@immutable
abstract class CategoryChanged extends ReportEvent {
  const CategoryChanged({@required this.category})
      : super(_ReportEvent.CategoryChanged);

  factory CategoryChanged.create({@required String category}) =
      _CategoryChangedImpl;

  final String category;

  /// Creates a copy of this CategoryChanged but with the given fields
  /// replaced with the new values.
  CategoryChanged copyWith({String category});
}

@immutable
class _CategoryChangedImpl extends CategoryChanged {
  const _CategoryChangedImpl({@required this.category})
      : super(category: category);

  @override
  final String category;

  @override
  _CategoryChangedImpl copyWith({Object category = superEnum}) =>
      _CategoryChangedImpl(
        category: category == superEnum ? this.category : category as String,
      );
  @override
  String toString() => 'CategoryChanged(category: ${this.category})';
  @override
  List<Object> get props => [category];
}

@immutable
abstract class GetPosition extends ReportEvent {
  const GetPosition() : super(_ReportEvent.GetPosition);

  factory GetPosition.create() = _GetPositionImpl;
}

@immutable
class _GetPositionImpl extends GetPosition {
  const _GetPositionImpl() : super();

  @override
  String toString() => 'GetPosition()';
}

@immutable
abstract class PickCamera extends ReportEvent {
  const PickCamera() : super(_ReportEvent.PickCamera);

  factory PickCamera.create() = _PickCameraImpl;
}

@immutable
class _PickCameraImpl extends PickCamera {
  const _PickCameraImpl() : super();

  @override
  String toString() => 'PickCamera()';
}

@immutable
abstract class PickImage extends ReportEvent {
  const PickImage() : super(_ReportEvent.PickImage);

  factory PickImage.create() = _PickImageImpl;
}

@immutable
class _PickImageImpl extends PickImage {
  const _PickImageImpl() : super();

  @override
  String toString() => 'PickImage()';
}

@immutable
abstract class RestorePreviouslyState extends ReportEvent {
  const RestorePreviouslyState() : super(_ReportEvent.RestorePreviouslyState);

  factory RestorePreviouslyState.create() = _RestorePreviouslyStateImpl;
}

@immutable
class _RestorePreviouslyStateImpl extends RestorePreviouslyState {
  const _RestorePreviouslyStateImpl() : super();

  @override
  String toString() => 'RestorePreviouslyState()';
}

@immutable
abstract class ReportSent extends ReportEvent {
  const ReportSent() : super(_ReportEvent.ReportSent);

  factory ReportSent.create() = _ReportSentImpl;
}

@immutable
class _ReportSentImpl extends ReportSent {
  const _ReportSentImpl() : super();

  @override
  String toString() => 'ReportSent()';
}
