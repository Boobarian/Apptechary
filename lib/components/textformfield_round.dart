import 'package:flutter/material.dart';

class RoundTextFormField extends StatelessWidget {
  final Function validationCallback;
  final Function updateValueCallback;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final Color cursorColor;
  final Color labelColor;
  final Color hintColor;
  final Color textColor;
  final String labelText;
  final String hintText;
  final String initialValue;
  final bool autoValidate;
  final bool obscure;

  RoundTextFormField({
    @required this.updateValueCallback,
    this.validationCallback,
    this.borderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textColor,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.autoValidate,
    this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure ?? false,
      style: TextStyle(
        color: textColor ?? Colors.black,
      ),
      cursorColor: cursorColor ?? Colors.black,
      textAlign: TextAlign.center,
      autovalidate: autoValidate ?? false,
      decoration: InputDecoration(
        fillColor: fillColor ?? null,
        filled: fillColor ?? false,
        labelText: labelText ?? null,
        labelStyle: TextStyle(color: labelColor ?? Colors.black),
        hintText: labelText ?? null,
        hintStyle: TextStyle(color: hintColor ?? Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: borderColor ?? Colors.lightBlue, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: focusedBorderColor ?? Colors.lightBlue, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
      validator: validationCallback ?? () => null,
      onChanged: updateValueCallback,
    );
  }
}
