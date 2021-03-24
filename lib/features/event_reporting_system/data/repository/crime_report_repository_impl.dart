

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/crime_report.dart';
import '../../domain/repositories/crime_report_repository.dart';
import '../datasources/crime_report_remote_data_source.dart';
import '../models/crime_report_model.dart';

class CrimeReportRepositoryImpl implements CrimeReportRepository {
  CrimeReportRemoteDataSource _crimeReportRemoteDataSource;

  CrimeReportRepositoryImpl() 
    : _crimeReportRemoteDataSource = CrimeReportRemoteDataSourceImpl();

  Either<Failure, void> cacheCrimeReport(CrimeReport crimeReport) {
    try {
      _crimeReportRemoteDataSource.cacheCrimeReport(CrimeReportModel.from(crimeReport));
      return Right(null);
    } on StorageException {
      return Left(StorageFailure(2));
    }
  }
}