import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/reusable_card.dart';
import '../widgets/icon_content.dart';
import '../constants/constants.dart';
import '../widgets/round_icon_button.dart';
import '../widgets/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender {
  None,
  Male,
  Female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _cardSelected = Gender.None;
  int _height = kDefaultHeight;
  int _weight = kDefaultWeight;
  int _age = kDefaultAge;

  Color updateColor(Gender gender) {
    return (_cardSelected == gender) ? kActiveCardColor: kInactiveCardColor;
  }

  void genderSelection(Gender gender) {
      setState( () {
        _cardSelected = (_cardSelected == gender) ? Gender.None : gender;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget> [
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onTap: () {genderSelection(Gender.Male);},
                    color: updateColor(Gender.Male),
                      child: IconContent(FontAwesomeIcons.mars,
                          text: "MALE"
                      ),
                  ),
                ),
                Expanded(flex: 1,
                  child: ReusableCard(
                    onTap: () {genderSelection(Gender.Female);},
                    color: updateColor(Gender.Female),
                    child: IconContent(FontAwesomeIcons.venus,
                          text: "FEMALE"
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: ReusableCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Text('HEIGHT', style: kLabelTextStyle,),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text("$_height", style: kNumberTextStyle,),
                        Text('cm', style: kLabelTextStyle,),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kSliderActiveColor,
                        inactiveTrackColor: kSliderInactiveColor,
                        thumbColor: kThumbColor,
                        overlayColor: kThumbColor.withAlpha(kOverlayAlpha),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                          min: kMinHeight.toDouble(),
                          max: kMaxHeight.toDouble(),
                          value: _height.toDouble(),
                          onChanged: (double newVal) {
                            setState(() {
                              _height = newVal.round();
                            });
                            return newVal.round();
                          }
                      ),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget> [
                Expanded(flex: 1,
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          Text("WEIGHT", style: kLabelTextStyle),
                          Text(_weight.toString(), style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(FontAwesomeIcons.minus,
                                  onPressed: () {setState(() {
                                    _weight --;
                                  });}),
                              RoundIconButton(FontAwesomeIcons.plus,
                                  onPressed: () {setState(() {
                                    _weight ++;
                                  });}),
                            ],
                          ),
                        ],
                      ),
                    ),
                ),
                Expanded(flex: 1,
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Text("AGE", style: kLabelTextStyle),
                        Text(_age.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus,
                                onPressed: () {setState(() {
                                  _age --;
                                });}),
                            RoundIconButton(FontAwesomeIcons.plus,
                                onPressed: () {setState(() {
                                  _age ++;
                                });}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: this._height, weight: this._weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(bmiResult: calc.calculateBMI(),
                                                                    bmiResultText: calc.getResult(),)));
              },

            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}







