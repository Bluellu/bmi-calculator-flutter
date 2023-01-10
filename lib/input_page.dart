import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int _cardSelected = -1;

  Color updateColor(int index) {
    return (_cardSelected == index) ? activeCardColor: inactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget> [
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget> [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState( () {
                        _cardSelected = (_cardSelected == 0) ? -1 : 0;
                      });
                    },
                    child: ReusableCard(
                        color: updateColor(0),
                        child: IconContent(FontAwesomeIcons.mars,
                            text: "MALE"
                        ),
                    ),
                  ),
                ),
                Expanded(flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState( () {
                        _cardSelected = (_cardSelected == 1) ? -1 : 1;
                      });
                    },
                    child: ReusableCard(
                      color: updateColor(1),
                      child: IconContent(FontAwesomeIcons.venus,
                            text: "FEMALE"
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: ReusableCard(
                color: activeCardColor
              )
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget> [
                Expanded(flex: 1,
                    child: ReusableCard(
                          color: activeCardColor
                    ),
                ),
                Expanded(flex: 1,
                    child: ReusableCard(
                        color: activeCardColor
                    ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}





