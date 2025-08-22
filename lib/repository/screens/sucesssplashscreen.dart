import 'package:flutter/material.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';
import 'package:helper_module_frontend/repository/screens/helpersscreen.dart';
import 'dart:async';

import 'package:helper_module_frontend/repository/widgets/uihelper.dart';

class SucessSplashScreen extends StatefulWidget {
  const SucessSplashScreen({super.key});

  @override
  State<SucessSplashScreen> createState() => _SucessSplashScreenState();
}

class _SucessSplashScreenState extends State<SucessSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HelpersScreen()),
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
            Icon(Icons.check_circle, color: Appcolors.primaryColor, size: 60),
            SizedBox(height: 20),
            Uihelper.CustomFont(
              text: "Helper Added!",
              color: Colors.black,
              fontweight: FontWeight.bold,
              fontsize: 24,
              fontfamily: 'Nunito_SansBold',
            ),
          ],
        ),
      ),
    );
  }
}
