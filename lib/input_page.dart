import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: ReusableCard(
                      color: activeCardColor,
                      child: IconContent(FontAwesomeIcons.mars,
                          text: "MALE"
                      ),
                  ),
                ),
                Expanded(flex: 1,
                  child: ReusableCard(
                    color: activeCardColor,
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
        Text(this.text, style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)))
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;

  ReusableCard({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: this.color
      ),
    );
  }
}

