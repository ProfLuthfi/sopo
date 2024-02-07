import 'package:flutter/material.dart';
import 'package:sopo/screens/home_screen.dart';
import 'package:sopo/screens/loginsimple.dart';
import 'package:sopo/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(backgroundColor: Colors.white),
      home: SplashScreen(),
    );
  }
}
