import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';

import 'package:eventreportingsystem/core/error/failures.dart';
import 'package:eventreportingsystem/core/usecases/usecase.dart';
import 'package:eventreportingsystem/features/event_reporting_system/domain/entities/crime_report.dart';
import 'package:eventreportingsystem/features/event_reporting_system/domain/repositories/crime_report_repository.dart';
import 'package:eventreportingsystem/features/event_reporting_system/domain/usecases/cache_crime_report.dart';


class MockCrimeRepository extends Mock implements CrimeReportRepository{}

void main() {
  CacheCrimeReport cacheCrimeReport;
  MockCrimeRepository mockCrimeRepository;
  CrimeReport tCrimeReport = CrimeReport(description: 'test', category: 't1', position: Position());

  setUp((){
    mockCrimeRepository = MockCrimeRepository();
    cacheCrimeReport = CacheCrimeReport(mockCrimeRepository);
  });

  test( 
    'should cache crime report',
    () {
      when(mockCrimeRepository.cacheCrimeReport(tCrimeReport))
      .thenAnswer((_) => Right(true));

      final result = cacheCrimeReport(Params(crimeReport: tCrimeReport));

      expect(result, equals(Right(true)));
    } 
  );

  test( 
    'should fail cache',
    () {
      when(mockCrimeRepository.cacheCrimeReport(tCrimeReport))
      .thenAnswer((_) => Left(StorageFailure(1)));

      final result = cacheCrimeReport(Params(crimeReport: tCrimeReport));

      expect(result, equals(Left(StorageFailure(1))));
    } 
  );
}