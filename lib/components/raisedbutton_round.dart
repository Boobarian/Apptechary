import 'package:flutter/material.dart';

class RoundRaisedButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final Function buttonCallback;

  RoundRaisedButton({
    this.title,
    this.buttonColor,
    this.textColor,
    this.buttonCallback
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5.0,
      color: buttonColor?? Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: buttonCallback?? (){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('hey you just pressed this button!')));
      },
      child: Container(
        child: Text(title?? 'Button',
        style: TextStyle(
          color: textColor?? Colors.white,
        ),),
      ),
    );
  }
}
