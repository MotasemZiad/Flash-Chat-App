import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hint;
  final TextInputType keyboardType;
  final bool isSecured;
  final Color borderColor;
  final Function onChange;

  ReusableTextField(
      {this.hint,
      this.borderColor,
      this.keyboardType,
      this.isSecured = false,
      @required this.onChange});
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: keyboardType,
        obscureText: isSecured,
        textAlign: TextAlign.center,
        onChanged: onChange,
        decoration: kTextFieldDecoration.copyWith(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ));
  }
}
