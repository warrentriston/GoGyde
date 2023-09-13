import 'package:flutter/material.dart';
import 'package:gogyde/controllers/AuthController.dart';
import 'package:get/get.dart';
import 'package:gogyde/screens/otp_verification.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const id = "/login";

  final LoginController loginController = Get.find(); // it'll work!

  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerOTP = TextEditingController();

  void signInWithPhone() {
    Get.toNamed(OTPVerificationScreen.id);
  }


  Widget _entryfield(String title, TextEditingController controller) {

    return Container(
        padding: const EdgeInsets.only(top: 16),
        child: TextField(
            onChanged: (value) {
              loginController.updatePhoneNumber(value);
            },
            maxLength: 10,
            controller: controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                labelText: title, border: const OutlineInputBorder())));
  }

  Widget _submitButton() {
    return Obx(() =>
        ElevatedButton(
            onPressed: loginController.phoneNumber.value.length == 10
                ? signInWithPhone
                : null,
            child: const Text("Login")));
  }

  Widget _loginImage(double screenWidth) {
    return Image(
        width: screenWidth * 0.4,
        height: screenWidth * 0.4,
        image: const AssetImage('assets/images/login.png'));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    var enterPhoneNumberText = Container(
      padding: const EdgeInsets.only(top: 48),
      child: Text(
          style: Theme
              .of(context)
              .textTheme
              .displaySmall,
          "Enter your 10 digit phone number"),
    );

    var getOTPContainer = Container(
      padding: const EdgeInsets.only(top: 48),
      child: _submitButton(),
    );

    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _loginImage(screenWidth),
                    enterPhoneNumberText,
                    _entryfield("Phone", _controllerPhone),
                    getOTPContainer,
                  ],
                ))));
  }
}

