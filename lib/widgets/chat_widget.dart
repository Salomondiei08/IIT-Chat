import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 4)]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage('assets/images/logo.png'),
            radius: 8.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Licence 1 - CS',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "Vous : D'accord 🥰",
                  style: TextStyle(fontSize: 18.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  '10:27',
                  style: TextStyle(fontSize: 16.sp),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
