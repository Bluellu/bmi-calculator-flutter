import 'package:flutter/material.dart';
import '../constants/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent(this.icon, {this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(this.icon, size: 80.0),
        SizedBox(height: 15.0),
        Text(this.text, style: kLabelTextStyle)
      ],
    );
  }
}