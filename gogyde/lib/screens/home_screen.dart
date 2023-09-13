import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gogyde/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:gogyde/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = "/home";

  HomeScreen({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
    // Get.showSnackbar(
    //   const GetSnackBar(
    //     title: "User Logged out",
    //     icon: Icon(Icons.check),
    //     duration: Duration(seconds: 2),
    //   ),
    // );
    Get.offAllNamed(LoginScreen.id);
  }

  Widget _title() {
    return const Text("Home");
  }

  Widget _userName() {
    return Text("Phone${user?.phoneNumber ?? 'null'}");
  }

  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: signOut,
        child: const Text("Sign out")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userName(),
            _signOutButton()
          ],
        )
      ),
    );
  }
}