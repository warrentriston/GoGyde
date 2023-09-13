import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gogyde/controllers/AuthController.dart';
import 'package:get/get.dart';
import 'package:gogyde/controllers/SplashController.dart';
import 'package:gogyde/logger.dart';
import 'package:gogyde/screens/home_screen.dart';
import 'package:gogyde/screens/login_screen.dart';
import 'package:gogyde/screens/otp_verification.dart';

class SplashScreen extends StatefulWidget {
  static const id = "/splash";

  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController()); // it'll work!

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  final SplashController controller = Get.find(); // it'll work!

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 1),
      () {
        if (controller.currentUser == null) {
          Get.offAllNamed(LoginScreen.id);
        } else {
          Get.offAllNamed(HomeScreen.id);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.background,
      child: const Image(
          alignment: Alignment.center,
          image: AssetImage('assets/images/gogydeiconwhite.png')),
    );
  }
}
