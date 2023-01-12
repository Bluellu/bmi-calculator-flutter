import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xFF090C22)),
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // sliderTheme: SliderTheme.of(context).copyWith(
        //   activeTrackColor: Colors.white,
        //   inactiveTrackColor: Color(0xFF8D8E98),
        //   thumbColor: Color(0xFFEB1555),
        //   overlayColor: Color(0xFFEB1555).withAlpha(0x1f),
        //   thumbShape: RoundSliderThumbShape(
        //     enabledThumbRadius: 15.0,
        //   ),
        //   overlayShape: RoundSliderOverlayShape(
        //     overlayRadius: 30.0,
        //   ),
        // ),
      ),
    );
  }
}

