import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/crime_report.dart';


abstract class CrimeReportRepository {
  Either<Failure, void> cacheCrimeReport(CrimeReport crimeReport);
}

