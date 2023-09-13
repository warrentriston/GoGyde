import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  //TODO: What is final in dart, Is var auto private with _
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authUpdateStream => _firebaseAuth.authStateChanges();

  //TODO: What is required
  Future<void> signinWithOTP(
      {required String phoneNumber, required String otp}) async {
    return await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        print("verificationCompleted");
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) async {
        print("codeSent");
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp);

        UserCredential userCredential = await _firebaseAuth
            .signInWithCredential(credential);
        print("Uid${userCredential.user?.uid}");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("codeAutoRetrievalTimeout");
      },
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
