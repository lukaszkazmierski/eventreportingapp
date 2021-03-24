
import 'package:super_enum/super_enum.dart';

import '../../../data/models/user_model.dart';

part 'registration_state.super.dart';

@superEnum 
enum _RegistrationState {
  @Data(fields: [
    DataField<UserModel>('userModel'),
  ])
  UserInitial,
  @Data(fields: [
    DataField<UserModel>('userModel'),
  ])
  UserChanged,
  @object
  SuccessRegister,
  @Data(fields: [
    DataField<String>('message'),
  ])
  Error
}