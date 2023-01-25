import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  Map<int, String> labels = {
    0: 'underweight',
    1: 'ideal',
    2: 'overweight'
  };

  Map<int, String> interpretations = {
    0: 'You have a lower than normal body weight.',
    1: 'Your body weight is perfect.',
    2: 'You hav a higher than normal body weight. Try to exercise more.'
  };



  int result = 0;
  double calculatedBMI = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('Your Result', style: kTitleTextStyle, textAlign: TextAlign.center,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  Text(labels[result], style: kWeightLabelTextStyle, textAlign: TextAlign.center,),
                  Text(calculatedBMI.toString(), style: kBMITextStyle, textAlign: TextAlign.center,),
                  Text(interpretations[result], style: kBodyTextStyle, textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
