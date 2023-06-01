import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/app_theme.dart';
import '../widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  icon: Icons.mail,
                  text: 'Email',
                ),
                SizedBox(
                  height: 2.h,
                ),
                const AppTextField(
                  icon: Icons.security,
                  text: 'Password',
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Mot de pass Oublié ?',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Center(child: AppButton(text: 'Se Connecter')),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Text(
                      'Pas encore de compte ?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "S'inscrire",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          color: Colors.red),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
