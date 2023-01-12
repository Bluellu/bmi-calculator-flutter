import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  final Function onPressed;

  RoundIconButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: this.onPressed,
        shape: const CircleBorder(),
        constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: kDefaultButton,
    );
  }
}
