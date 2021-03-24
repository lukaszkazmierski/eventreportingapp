import 'package:super_enum/super_enum.dart';

part 'registration_event.super.dart';

@superEnum
enum _RegistrationEvent {
  @Data(fields: [
    DataField<String>('email'),
  ])
  EmailChanged,
  @Data(fields: [
    DataField<String>('password'),
  ])
  PasswordChanged,
  @object
  RestorePreviouslyState,
  @object
  RegistrationSubmitted,
}