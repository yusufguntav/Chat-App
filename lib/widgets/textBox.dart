import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
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
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  late bool _isPasswordVisible = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        keyboardType: (widget.isMailAdress) ? TextInputType.emailAddress : null,
        obscureText: _isPasswordVisible,
        decoration: InputDecoration(
          suffixIcon: (widget.isPassword)
              ? IconButton(
                  icon: (_isPasswordVisible)
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  color: Colors.white,
                  onPressed: (() {
                    setState(
                      () {
                        _isPasswordVisible = !_isPasswordVisible;
                      },
                    );
                  }),
                )
              : widget.suffixIcon,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
