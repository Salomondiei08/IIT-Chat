import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_theme.dart';

class InfoTileWidget extends StatelessWidget {
  const InfoTileWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: AppTheme.grayColor,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    size: 22.sp,
                  ),
                  Text(
                    text,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 20.sp,
                    color: AppTheme.redColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
