import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../providers/auth_provider.dart';
import '../utils/app_theme.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  // Reset the user
  Future<void> resetPassword(context) async {
    if (_formKey.currentState!.validate()) {
      await AuthenticationProvider()
          .resetPasswordLink(context, email: _emailController.text.trim());
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
                  SizedBox(
                    height: 4.h,
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
                            text: 'Réinitialiser votre mot de passe',
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await resetPassword(context);
                              setState(() {
                                isLoading = false;
                              });
                            }),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
