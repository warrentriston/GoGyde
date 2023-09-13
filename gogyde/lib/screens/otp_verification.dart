import 'package:flutter/material.dart';
import 'package:gogyde/controllers/AuthController.dart';
import 'package:get/get.dart';
import 'package:gogyde/logger.dart';
import 'package:gogyde/screens/home_screen.dart';

class OTPVerificationScreen extends StatelessWidget {
  static const id = "/otp";

  OTPVerificationScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.find(); // it'll work!

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();

  _onDigitEntry() {
    loginController.otp.value = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text +
        controller5.text +
        controller6.text;
  }

  Widget _otpTFRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      OtpInput(controller1, true),
      OtpInput(controller2, false),
      OtpInput(controller3, false),
      OtpInput(controller4, false),
      OtpInput(controller5, false),
      OtpInput(controller6, false)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    controller1.removeListener(_onDigitEntry);
    controller2.removeListener(_onDigitEntry);
    controller3.removeListener(_onDigitEntry);
    controller4.removeListener(_onDigitEntry);
    controller5.removeListener(_onDigitEntry);
    controller6.removeListener(_onDigitEntry);
    controller1.addListener(_onDigitEntry);
    controller2.addListener(_onDigitEntry);
    controller3.addListener(_onDigitEntry);
    controller4.addListener(_onDigitEntry);
    controller5.addListener(_onDigitEntry);
    controller6.addListener(_onDigitEntry);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'OTP Verification',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Enter the 6 digit OTP sent to: ${loginController.phoneNumber.value}',
          ),
          const SizedBox(
            height: 30,
          ),
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _otpTFRow(), // auto focus
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(() => ElevatedButton(
              onPressed: loginController.otp.value.length == 6
                  ? () async {
                      var result = await loginController.signinWithOTP();
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "Yay!",
                          message: 'User Logged in Successfully',
                          icon: Icon(Icons.check),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Get.offAllNamed(HomeScreen.id);
                    }
                  : null,
              child: const Text('Submit'))),
          const SizedBox(
            height: 30,
          ),
          // Display the entered OTP code
        ],
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final bool autoFocus;
  final TextEditingController editingController;

  const OtpInput(this.editingController, this.autoFocus, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      height: 60,
      width: 60,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        controller: editingController,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        }
      ),
    );
  }
}
