import 'package:flutter/material.dart';

class RectangularTextFormField extends StatelessWidget {
  @required final Function onChanged;
  final String hintText;

  RectangularTextFormField({this.onChanged, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      autovalidate: false,
      textAlign: TextAlign.center,
      validator: (value){
        if(value.isEmpty){
          return 'Do not leave the fields empty!';
        }
        else{
          return null;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          )
      ),
    );
  }
}