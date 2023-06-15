import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iit_chat/providers/auth_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const IITChat());
}

class IITChat extends StatelessWidget {
  const IITChat({super.key});

  @override
  Widget build(BuildContext context) {

    return ResponsiveSizer(
      builder: (context, orientation, scrennType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IIT Chat',
            home: AuthenticationProvider().handleAuth());
      },
    );
  }
}
