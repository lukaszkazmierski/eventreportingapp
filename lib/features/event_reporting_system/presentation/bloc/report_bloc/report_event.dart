
import 'package:super_enum/super_enum.dart';

part 'report_event.super.dart';


@superEnum
enum _ReportEvent {
  @Data(fields: [
    DataField<String>('description'),
  ])
  DescriptionChanged,
  @Data(fields: [
    DataField<String>('category')
  ])
  CategoryChanged,
  @object
  GetPosition,
  @object
  PickCamera,
  @object
  PickImage,
  @object
  RestorePreviouslyState,
  @object
  ReportSent
  
}