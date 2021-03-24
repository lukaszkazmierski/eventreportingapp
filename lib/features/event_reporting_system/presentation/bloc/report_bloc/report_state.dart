import 'package:super_enum/super_enum.dart';

import '../../../domain/entities/crime_report.dart';

part 'report_state.super.dart';


@superEnum
enum _ReportState {
  @Data(fields: [
    DataField<CrimeReport>('crimeReport')
  ])
  ReportInitial,

  @Data(fields: [
    DataField<CrimeReport>('crimeReport')
  ])
  ReportChanged,

  @object
  Success,

  @object
  PhotoError,

  @object
  NetworkError
}