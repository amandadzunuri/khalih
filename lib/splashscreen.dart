import 'package:flutter/material.dart';
import 'package:khalih/pilih_user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMenu();
  }

  _navigateToMenu() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PilihUser()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5E8), // Matches the background color in the image
      body: Center(
        child: Image.asset('assets/images/logo_kalih.png'),
      ),
    );
  }
}
