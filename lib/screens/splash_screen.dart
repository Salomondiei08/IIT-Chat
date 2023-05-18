import 'dart:async';

import 'package:flutter/material.dart';
import 'home_scrren.dart';
import '../utils/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const HomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGrayColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 20.h, child: Image.asset('assets/images/logo.png')),
            const SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: AppTheme.redColor,
            )
          ],
        ),
      ),
    );
  }
}
