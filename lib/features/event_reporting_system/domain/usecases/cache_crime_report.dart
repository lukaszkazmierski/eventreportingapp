import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/crime_report.dart';
import '../repositories/crime_report_repository.dart';

class CacheCrimeReport implements UseCase<void, Params> {
  final CrimeReportRepository crimeRepository;

  CacheCrimeReport(this.crimeRepository);

  @override
  Either<Failure, void> call(Params params) {
    return crimeRepository.cacheCrimeReport(params.crimeReport);
  }
}

class Params extends Equatable {
  final CrimeReport crimeReport;

  Params({@required this.crimeReport});

  @override
  List<Object> get props => [crimeReport];
}