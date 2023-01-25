import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/bottom_button.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String bmiResultText;

  ResultsPage({@required this.bmiResult, @required this.bmiResultText});

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
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
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
                  Text(bmiResultText, style: kWeightLabelTextStyle, textAlign: TextAlign.center,),
                  Text(bmiResult, style: kBMITextStyle, textAlign: TextAlign.center,),
                  Text(kInterpretations[bmiResultText], style: kBodyTextStyle, textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputPage()));},
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
