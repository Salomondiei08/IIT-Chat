import 'package:flutter/material.dart';
import 'package:iit_chat/utils/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/info_tile_widget.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGrayColor,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/logo.png',
                      ),
                      radius: 18.w,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Salomon DIEI',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Salomon DIEI - salomon.diei@iit.ci",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const InfoTileWidget(
                      text: "Modifier mes Infos",
                      icon: Icons.info_outline_rounded,
                    ),
                    const InfoTileWidget(
                      text: "Changer mon mot de passe",
                      icon: Icons.security,
                    ),
                    const InfoTileWidget(
                      text: "Changer la langue",
                      icon: Icons.language,
                    ),
                    const InfoTileWidget(
                      text: "Deconnexion",
                      icon: Icons.logout,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const InfoTileWidget(
                      text: "Developppeurs",
                      icon: Icons.info_outline,
                    ),
                    const InfoTileWidget(
                      text: "Aide et Contacts",
                      icon: Icons.help_outline,
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
