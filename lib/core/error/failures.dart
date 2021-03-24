import 'package:equatable/equatable.dart';
import 'package:super_enum/super_enum.dart';

abstract class Failure extends Equatable {
  final int code;
  
  Failure(this.code);

  @override
  String toString() {
    return code.toString();
  }

  @override
  List<Object> get props => [code];
}
//throw failure
// General failures
class StorageFailure extends Failure {
  StorageFailure(int code) 
    : super(code);
}
class ImagePickerFailure extends Failure {
  ImagePickerFailure(int code) 
    : super(code);
}

class LoginFailure extends Failure {
  LoginFailure(int code) 
    : super(code);
}

class RegistrationFailure extends Failure {
  RegistrationFailure(int code) 
    : super(code);
}
