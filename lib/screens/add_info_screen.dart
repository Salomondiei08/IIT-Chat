import 'package:flutter/material.dart';
import 'package:iit_chat/screens/home_scrren.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_theme.dart';
import '../widgets/app_button.dart';
import '../widgets/app_drop_down.dart';

class AddInfoScreen extends StatefulWidget {
  const AddInfoScreen({super.key});

  @override
  State<AddInfoScreen> createState() => _AddInfoScreenState();
}

class _AddInfoScreenState extends State<AddInfoScreen> {
  List<String> studyLevels = [
    "Licence 1",
    "Licence 2",
    "Licence 3",
    "Master 1",
    "Master 2",
  ];
  String dropdownvalue1 = "Genie Logiciel";
  String dropdownvalue2 = 'Licence 1';
  String studyLevelsText = '';
  String studyFieldsText = '';

  List<String> fields = [
    "Genie Logiciel",
    "Réseaux-Télécoms",
    "Finance Comptabilité",
    "Marketing",
    "Biotechnologie"
  ];
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
                  height: 10.h,
                ),
                AppDropDowwn(
                  hintText: "Filière",
                  dropdownvalue: dropdownvalue1,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownvalue1 = newValue!;
                    });
                  },
                  items: fields
                      .map((items) => DropdownMenuItem(
                          value: items,
                          onTap: () => setState(() {
                                studyFieldsText = items;
                              }),
                          child: Text(items)))
                      .toList(),
                ),
                SizedBox(
                  height: 2.h,
                ),
                AppDropDowwn(
                  hintText: "Niveau d'étude",
                  dropdownvalue: dropdownvalue2,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownvalue2 = newValue!;
                    });
                  },
                  items: studyLevels
                      .map((items) => DropdownMenuItem(
                          value: items,
                          onTap: () => setState(() {
                                studyLevelsText = items;
                              }),
                          child: Text(items)))
                      .toList(),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: AppButton(
                    text: 'Terminer',
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const HomeScreen())),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Text(
                    'IIT Chat V1?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
