import 'package:firebase_auth/firebase_auth.dart';
import 'package:gogyde/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:gogyde/screens/home_screen.dart';
import 'package:gogyde/screens/login_screen.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authUpdateStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        });
  }
}
