import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3, 5), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(color: Colors.black),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          fillColor: Colors.white,
          labelText: text,
          suffixIcon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
