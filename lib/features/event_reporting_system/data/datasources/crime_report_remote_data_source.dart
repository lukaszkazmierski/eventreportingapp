import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/generators/uid_generator.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/util/string_file_extender.dart';
import '../models/crime_report_model.dart';

abstract class CrimeReportRemoteDataSource {
  void cacheCrimeReport(CrimeReportModel crimeReportModel);
}

class CrimeReportRemoteDataSourceImpl implements CrimeReportRemoteDataSource {
  final Reference firebaseStorageRef = FirebaseStorage.instance.ref();
  final LocationService _locationService = LocationService();
  final FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;

  void cacheCrimeReport(CrimeReportModel crimeReportModel) async {
    final placemarks =
        await _locationService.getCurrentPlacemark(crimeReportModel.position);

    if (crimeReportModel.photoRef.isNotEmpty) {
      UploadTask storageUploadTask = _cacheToStorage(
          crimeReportModel.photoRef.toFile(), placemarks[0].locality);

      TaskSnapshot taskSnapshot = await storageUploadTask;
      _cacheToCloud(crimeReportModel.changePhotoRef(taskSnapshot.ref.fullPath),
          placemarks[0].locality);
    } else {
      _cacheToCloud(crimeReportModel, placemarks[0].locality);
    }
  }

  UploadTask _cacheToStorage(File photoRef, String city) {
    return firebaseStorageRef
        .child(city)
        .child(uidGenerator.generateRandomId)
        .putFile(photoRef);
  }

  void _cacheToCloud(CrimeReportModel crimeReportModel, String city) {
    firebaseInstance.collection(city).add(crimeReportModel.toMap());
  }
}
