import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  TextBox({
    super.key,
    this.isPassword = false,
    this.isMailAdress = false,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    required this.hintText,
  });
  Widget? suffixIcon;
  TextEditingController? controller;
  bool isMailAdress;
  bool isPassword;
  Function(String value)? onChanged;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: (isMailAdress) ? TextInputType.emailAddress : null,
        obscureText: isPassword,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
