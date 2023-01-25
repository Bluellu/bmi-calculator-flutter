import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  final IconData data;
  final Function onPressed;

  RoundIconButton(this.data, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(this.data),
        onPressed: this.onPressed,
        shape: const CircleBorder(),
        constraints: const BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
      fillColor: kDefaultButton,
      elevation: 6.0,

    );
  }
}
