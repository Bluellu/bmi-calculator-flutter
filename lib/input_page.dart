import 'package:flutter/material.dart';

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
                  child: ReusableCard(),
                ),
                Expanded(flex: 1, child: ReusableCard()),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: ReusableCard()
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget> [
                Expanded(flex: 1, child: ReusableCard()),
                Expanded(flex: 1, child: ReusableCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF1D1E33)
      ),
    );
  }
}

