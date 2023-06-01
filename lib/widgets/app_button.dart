import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 3)],
          color: AppTheme.redColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 20.w),
          child: Text(
            text,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
