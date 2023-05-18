import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const IITChat());
}

class IITChat extends StatelessWidget {
  const IITChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, scrennType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IIT Chat',
        home: SplashScreen(),
      );
    });
  }
}
