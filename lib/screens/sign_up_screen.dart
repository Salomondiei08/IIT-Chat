import 'package:flutter/material.dart';
import 'package:iit_chat/screens/add_info_screen.dart';
import 'package:iit_chat/screens/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_theme.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGrayColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Bienvenue',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'IIT-Chat découvrez, partagez',
                  style: TextStyle(fontSize: 17.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const AppTextField(
                  icon: Icons.person,
                  text: "Nom d'utilisateur",
                ),
                SizedBox(
                  height: 2.h,
                ),
                const AppTextField(
                  icon: Icons.security,
                  text: 'Password',
                ),
                SizedBox(
                  height: 2.h,
                ),
                const AppTextField(
                  icon: Icons.security,
                  text: 'Password',
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: AppButton(
                    text: 'Créer un compte',
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const AddInfoScreen())),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Text(
                    'Vous avez déja un compte ?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                  ),
                ),
                SizedBox(height: 1.h),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const LoginScreen())),
                    child: Text(
                      "Connectez vous",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
