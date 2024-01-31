// lib/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Membuat delay menggunakan Timer untuk simulasi splash screen selama 3 detik
    Timer(Duration(seconds: 3), () {
      // Pindah ke halaman berikutnya setelah splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tambahkan logo atau gambar splash screen di sini
            Text(
              'My App',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
