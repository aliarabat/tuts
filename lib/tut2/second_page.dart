import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String data;
  const SecondPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
