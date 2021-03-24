import 'package:super_enum/super_enum.dart';

part 'login_event.super.dart';

@superEnum
enum _LoginEvent {
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
  LogInSubmitted,
  @object
  ContinueAnonymously,
}