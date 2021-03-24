
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/crime_report.dart';


class CrimeReportModel extends CrimeReport {
  CrimeReportModel({
    @required String description,
    @required String category,
    @required Position position,
    String photoRef
  }) : super(
          description:  description,
          category: category,
          position: position,
          photoRef: photoRef);

  factory CrimeReportModel.from(CrimeReport crimeReport) {
    return CrimeReportModel(
      description: crimeReport.description,
      category: crimeReport.category,
      position: crimeReport.position,
      photoRef: crimeReport.photoRef
    );
  }

  CrimeReportModel changePhotoRef(newPhotoRef) {
    return CrimeReportModel(
      description: this.description,
      category: this.category, 
      position: this.position,
      photoRef: newPhotoRef ?? ''
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      "description" : description,
      "category" : category,
      "position" : GeoPoint(position.latitude, position.longitude),
      "photoRef" : photoRef
    };
  }
}