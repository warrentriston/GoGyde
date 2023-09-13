import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gogyde/AppThemes.dart';
import 'package:gogyde/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:gogyde/screens/app_screens.dart';

void main() async {
  runApp(const GoGydeApp());
}

class GoGydeApp extends StatelessWidget {
  const GoGydeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text("Error");
        }
        //
        // // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: AppThemes.lightTheme ,
            darkTheme: AppThemes.darkTheme,
            themeMode: ThemeMode.system,
            initialRoute: SplashScreen.id,
            getPages: AppScreens.list,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(
          child: Text("Loading", textDirection: TextDirection.ltr),
        );
      },
    );
  }
}
