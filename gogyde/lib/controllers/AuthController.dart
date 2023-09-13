import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../logger.dart';

class LoginController extends GetxController {
  static const TAG = "LoginController";

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  final RxString phoneNumber = "".obs;

  final RxString otp = "".obs;

  void updatePhoneNumber(String phoneNumber) {
    this.phoneNumber(phoneNumber);
  }

  Future<UserCredential> signinWithOTP() async {
    Completer<UserCredential> completer = Completer();

    var result = _firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+91${phoneNumber.value}",
      verificationCompleted: (PhoneAuthCredential credential) {
        CustomLogger.d(TAG, "verificationCompleted");
      },
      verificationFailed: (FirebaseAuthException e) {
        CustomLogger.e(TAG, "verificationFailed", e);
        completer.completeError(e);
      },
      codeSent: (String verificationId, int? resendToken) async {
        CustomLogger.d(TAG, "codeSent");
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp.value);

        UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        CustomLogger.d(TAG, "Uid: ${userCredential.user?.uid}");
        completer.complete(userCredential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        completer.completeError(Exception("codeAutoRetrievalTimeout"));
        CustomLogger.e(TAG, "codeAutoRetrievalTimeout", null);
      },
    );

    return completer.future;
  }

  bool isSignedIn() {
    return false;
  }
}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
