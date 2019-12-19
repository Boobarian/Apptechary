import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({this.icon, this.label, this.color, @required this.onPressed});

  final IconData icon;
  final String label;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: onPressed,
        label: Text(label),
        icon: Icon(icon),
        backgroundColor: color,
    );
  }
}
