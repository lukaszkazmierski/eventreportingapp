import 'package:meta/meta.dart';

class UserModel {
  final String email;
  final String password;

  UserModel({
    @required this.email,
    @required this.password,
  }) : assert(
        email != null && 
        password != null
      );

  factory UserModel.pure() {
    return UserModel(
      email: '', 
      password: '', 
    );
  }

  UserModel copyWith({
    String email,
    String password,
  }) {
    return UserModel(
      email: email ?? this.email, 
      password: password ?? this.password,
    );
  }

}



