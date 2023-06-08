import 'package:flutter/material.dart';
import 'package:iit_chat/screens/reset_screen.dart';
import 'package:iit_chat/screens/sign_up_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../providers/auth_provider.dart';
import '../utils/app_theme.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import 'add_info_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  // Login the user
  Future<void> signInUser(context) async {
    if (_formKey.currentState!.validate()) {
      final userCredential = await AuthenticationProvider().signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
      if (!(userCredential == null)) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (ctx) => const AddInfoScreen()));
      }
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
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const ResetScreen())),
                        child: Text(
                          'Mot de pass Oublié ?',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
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
                            text: 'Se Connecter',
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await signInUser(context);
                              setState(() {
                                isLoading = false;
                              });
                            }),
                  ),
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
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const SignUpScreen())),
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                              color: Colors.red),
                        ),
                      ),
                    ],
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
