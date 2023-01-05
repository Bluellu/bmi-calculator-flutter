import 'package:flutter/material.dart';

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
                  child: ReusableCard(activeCardColor),
                ),
                Expanded(flex: 1, child: ReusableCard(activeCardColor)),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: ReusableCard(activeCardColor)
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget> [
                Expanded(flex: 1, child: ReusableCard(activeCardColor)),
                Expanded(flex: 1, child: ReusableCard(activeCardColor)),
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

class ReusableCard extends StatelessWidget {
  final Color color;

  ReusableCard(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: this.color
      ),
    );
  }
}

