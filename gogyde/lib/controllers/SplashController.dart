import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../logger.dart';

class SplashController extends GetxController {
  static const TAG = "SplashController";
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Future<User?> isUserSignedIn() async {
    return Future<User?>.delayed(const Duration(seconds: 3), () {
      return _firebaseAuth.currentUser;
    });
  }
}

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => SplashController());
  }
}
