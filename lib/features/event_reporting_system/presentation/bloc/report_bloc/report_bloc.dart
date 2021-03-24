import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/network_handler.dart';
import '../../../../../core/services/image_picker_service.dart';
import '../../../../../core/services/location_service.dart';
import '../../../../../core/services/permission_service.dart';
import '../../../data/repository/crime_report_repository_impl.dart';
import '../../../domain/entities/crime_report.dart';
import '../../../domain/usecases/cache_crime_report.dart';
import 'report_event.dart';
import 'report_state.dart';

export './report_event.dart';
export './report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc()
      : _imagePickerService = ImagePickerService(),
        _locationService = LocationService(),
        _networkHandler = NetworkHandlerImpl(),
        _cacheCrimeReport = CacheCrimeReport(CrimeReportRepositoryImpl()),
        super(ReportState.reportInitial(crimeReport: CrimeReport.pure()));

  final ImagePickerService _imagePickerService;
  final LocationService _locationService;
  final NetworkHandler _networkHandler;
  final CacheCrimeReport _cacheCrimeReport;

  var lastCrimeReportCopy = CrimeReport.pure();

  Future<List<Placemark>> getLocationData(Position position) {
    return _locationService.getCurrentPlacemark(position);
  }

  @override
  Stream<ReportState> mapEventToState(
    ReportEvent event,
  ) async* {
    yield* event.when(
        descriptionChanged: (e) => _mapDescriptionChangedToState(e, state),
        categoryChanged: (e) => _mapCategoryChangedToState(e, state),
        getPosition: () => _mapPositionChangedToState(state),
        pickCamera: () => _mapPickCameraChangedToState(state),
        pickImage: () => _mapPickImageChangedToState(state),
        restorePreviouslyState: () => _mapRestorePreviouslyStateToState(state),
        reportSent: () => _mapReportSentToState(state));
  }

  Stream<ReportState> _mapDescriptionChangedToState(
      DescriptionChanged event, ReportState state) async* {
    CrimeReport crimeReport = state.crimeReport;
    yield ReportState.reportChanged(
        crimeReport: crimeReport.copyWith(description: event.description));
  }

  Stream<ReportState> _mapCategoryChangedToState(
      CategoryChanged event, ReportState state) async* {
    CrimeReport crimeReport = state.crimeReport;
    yield ReportState.reportChanged(
        crimeReport: crimeReport.copyWith(category: event.category));
  }

  Stream<ReportState> _mapPositionChangedToState(ReportState state) async* {
    var position = await _locationService.getCurrentPosition();

    CrimeReport crimeReport = state.crimeReport;
    yield ReportState.reportChanged(
        crimeReport: crimeReport.copyWith(position: position));
  }

  Stream<ReportState> _mapPickCameraChangedToState(ReportState state) async* {
    var img = await _imagePickerService.pickImage(_imagePickerService.camera);

    var photoPath = '';

    img.fold((l) => {photoPath = null}, (path) => {photoPath = path});

    if (photoPath == null) {
      photoPath = '';
      yield ReportState.photoError();
    }

    CrimeReport crimeReport = state.crimeReport;
    yield ReportState.reportChanged(
        crimeReport: crimeReport.copyWith(photoRef: photoPath));
  }

  Stream<ReportState> _mapPickImageChangedToState(ReportState state) async* {
    bool storageIsGranted =
        await permissionService.isStoragePermissionGranted();

    if (storageIsGranted == true) {
      var img =
          await _imagePickerService.pickImage(_imagePickerService.gallery);

      var photoPath = '';

      img.fold((l) => {photoPath = null}, (path) => {photoPath = path});

      if (photoPath == null) {
        photoPath = '';
        yield ReportState.photoError();
      }

      CrimeReport crimeReport = state.crimeReport;
      yield ReportState.reportChanged(
          crimeReport: crimeReport.copyWith(photoRef: photoPath));
    } else if (storageIsGranted == false) {
      await permissionService.initializeStoragePermission();
    } else {
      yield ReportState.photoError();
    }
  }

  Stream<ReportState> _mapRestorePreviouslyStateToState(
      ReportState state) async* {
    yield ReportState.reportChanged(crimeReport: lastCrimeReportCopy);
  }

  Stream<ReportState> _mapReportSentToState(ReportState state) async* {
    try {
      final isConnected = await _networkHandler.isConnected();

      if (isConnected) {
        _cacheCrimeReport(Params(crimeReport: state.crimeReport));
        yield ReportState.success();
      } else {
        lastCrimeReportCopy =  state.crimeReport;
        yield ReportState.networkError();
      }
    } on NetworkException {
      lastCrimeReportCopy =  state.crimeReport;
      yield ReportState.networkError();
    }
  }
}
