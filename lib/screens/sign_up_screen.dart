import 'package:flutter/material.dart';
import 'package:iit_chat/screens/add_info_screen.dart';
import 'package:iit_chat/screens/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../providers/auth_provider.dart';
import '../utils/app_theme.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  // Login the user
  Future<void> signUpUser(context) async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      final userCredential = await AuthenticationProvider().signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
      if (!(userCredential == null)) {
        userCredential.user?.updateDisplayName(_nameController.text.trim());
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (ctx) => const AddInfoScreen()));
      }
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGrayColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  AppTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Votre nom ne doit pas être nul";
                      }
                      return null;
                    },
                    textController: _nameController,
                    icon: Icons.person,
                    text: "Nom d'utilisateur",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "L'email ne doit pas être nulle";
                      } else if (!value.endsWith("@iit.ci")) {
                        return "L'addresse n'est iit.ci";
                      }
                      return null;
                    },
                    textController: _emailController,
                    icon: Icons.mail,
                    text: 'Email',
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Le mot de passe ne doit pas être nul";
                      } else if (value.length < 8) {
                        return "Mot de passe trop court";
                      }
                      return null;
                    },
                    obscureTexr: true,
                    textController: _passwordController,
                    icon: Icons.security,
                    text: 'Password',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: AppTheme.redColor,
                          )
                        : AppButton(
                            text: 'Créer un compte',
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await signUpUser(context);
                              setState(() {
                                isLoading = false;
                              });
                            },
                          ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Center(
                    child: Text(
                      'Vous avez déja un compte ?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.sp),
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
      ),
    );
  }
}
