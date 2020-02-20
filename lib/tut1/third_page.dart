import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  final String userName;
  final int points;
  const ThirdPage({Key key, @required this.userName, @required this.points})
      : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Username is ${widget.userName}'),
            SizedBox(height: 5.0),
            Text('Points: ${widget.points}')
          ],
        ),
      ),
    );
  }
}
