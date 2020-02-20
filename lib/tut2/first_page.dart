import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is 1st page'),
            SizedBox(
              height: 6,
            ),
            RaisedButton(
              child: Text("Go to second"),
              onPressed: () => Navigator.of(context).pushNamed('/second', arguments: "Data Passed"),
            ),
            SizedBox(
              height: 6,
            ),
            RaisedButton(
              child: Text("Go to error"),
              onPressed: () => Navigator.of(context).pushNamed('/dndnd'),
            ),
          ],
        ),
      ),
    );
  }
}
