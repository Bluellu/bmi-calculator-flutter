import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';


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
                    SizedBox(height: 15),
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
                          color: kActiveCardColor
                    ),
                ),
                Expanded(flex: 1,
                    child: ReusableCard(
                        color: kActiveCardColor
                    ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}





