import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/app_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/intro_image.png',
                    fit: BoxFit.fill,
                  ))
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                  color: AppTheme.ligthGrayColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  SizedBox(
                    height: 8.h,
                    width: 100.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Bienvenue sur IIT Chat,",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "l’appli officielledes étudiants de l’IIT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Conversez en tout simplicité',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7), fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppButton(text: 'Commencer')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

