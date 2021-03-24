import 'package:super_enum/super_enum.dart';

import '../../../data/models/user_model.dart';

part 'login_state.super.dart';

@superEnum
enum _LoginState {
  @Data(fields: [
    DataField<UserModel>('userModel'),
  ])
  UserInitial,
  @Data(fields: [
    DataField<UserModel>('userModel'),
  ])
  UserChanged,
  @object
  SuccessLogin,
  @Data(fields: [
    DataField<String>('message'),
  ])
  Error
}