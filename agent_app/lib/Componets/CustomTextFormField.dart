import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final bool isPhoneNumber;
  int maxLength;

  CustomTextFormField(
      {this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.isEmail = false,
      this.isPhoneNumber = false,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: "Avenir45"),
//          border: InputBorder.none,
      ),
      obscureText: isPassword ? true : false,
      maxLength: maxLength,
      validator: validator,
      onSaved: onSaved,
      keyboardType: getTextInputType(),
    );
  }

  TextInputType getTextInputType() {
    if (isEmail)
      return TextInputType.emailAddress;
    else if (isPhoneNumber)
      return TextInputType.number;
    else
      return TextInputType.text;
  }
}
