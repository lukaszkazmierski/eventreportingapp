import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../error/failures.dart';
import '../error/status_codes.dart';

class AuthenticationService {
  FirebaseAuth firebaseAuth;

  AuthenticationService() : firebaseAuth = FirebaseAuth.instance;

  Future<void> signInAnonymously() async {
    try {
      await firebaseAuth.signInAnonymously();
    } on FirebaseAuthException {}
  }

  Stream<User> userAuthStateChanges() =>
      FirebaseAuth.instance.authStateChanges();

  Future<Either<RegistrationFailure, void>> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user.sendEmailVerification();

      return Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(_onRegisterExceptionCode(e.code));
    }
  }

  RegistrationFailure _onRegisterExceptionCode(code) { 
    if (code == 'weak-password') {   
      return RegistrationFailure(RegisterStatusCode.weakPassword);
    } else if (code == 'email-already-in-use') {
      return RegistrationFailure(RegisterStatusCode.emailAlreadyInUser);
    } else if (code == 'invalid-email') {
      return RegistrationFailure(RegisterStatusCode.invalidEmail);
    } else {
      return RegistrationFailure(RegisterStatusCode.unknown);
    }
  }

  Future<Either<LoginFailure, void>> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(_onLoginExceptionCode(e.code));
    }
  }

  LoginFailure _onLoginExceptionCode(code) {
    if (code == 'user-not-found') {
      return LoginFailure(LoginStatusCode.userNotFound);
    } else if (code == 'wrong-password') {
      return LoginFailure(LoginStatusCode.wrongPassword);
    } else if (code == 'invalid-email') {
      return LoginFailure(LoginStatusCode.invalidEmail);
    } else {
      return LoginFailure(LoginStatusCode.unknown);
    }
  }

  void signOut() async {
    return await firebaseAuth.signOut();
  }

  void forgotPassword(String email) {
    firebaseAuth.sendPasswordResetEmail(email: email);
  }

  bool get isUserSignedIn {
    return firebaseAuth.currentUser != null ? true : false;
  }

  bool get isAnonymous => firebaseAuth.currentUser.isAnonymous != null ? true : false;

  String get getUserEmail => firebaseAuth.currentUser.email;

  Future<void> get resendEmailVerification async =>
      await firebaseAuth.currentUser.sendEmailVerification();

  bool get isEmailVerified => firebaseAuth.currentUser == null ? null : firebaseAuth.currentUser.emailVerified;
  Future<void> get refreshCurrentSignedUser async =>
      await firebaseAuth.currentUser.reload();
}
