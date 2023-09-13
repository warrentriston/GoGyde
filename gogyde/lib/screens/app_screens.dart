import 'package:get/get.dart';
import 'package:gogyde/screens/home_screen.dart';
import 'package:gogyde/screens/login_screen.dart';
import 'package:gogyde/controllers/AuthController.dart';
import 'package:gogyde/screens/otp_verification.dart';
import 'package:gogyde/screens/splash_screen.dart';
import '../controllers/SplashController.dart';

class AppScreens {
  static var list = [
    GetPage(
        name: SplashScreen.id,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: LoginScreen.id,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: OTPVerificationScreen.id,
        page: () => OTPVerificationScreen(),
        binding: LoginBinding()),
    GetPage(
        name: HomeScreen.id,
        page: () => HomeScreen())
  ];
}
