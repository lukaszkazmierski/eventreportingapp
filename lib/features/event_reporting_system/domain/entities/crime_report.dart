
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart' show required;

class CrimeReport extends Equatable {
  final String description;
  final String category;
  final Position position;
  final String photoRef;
  

  CrimeReport({
    @required this.description,
    @required this.category,
    @required this.position,
    this.photoRef
  }) : assert(description != null && category != null && position != null);

  factory CrimeReport.pure() {
    return CrimeReport(
      description: '', 
      category: '', 
      position: Position(longitude: 0, latitude: 0),
      photoRef: '');
  }

  CrimeReport copyWith({
    String description,
    String category,
    Position position,
    String photoRef
  }) {
    return CrimeReport(
      description: description ?? this.description, 
      category: category ?? this.category,
      position: position ?? this.position,
      photoRef: photoRef ?? this.photoRef
    );
  }


  @override
  List<Object> get props => [description, category, photoRef, position];

}