import 'package:flutter/material.dart';
import 'package:tuts/routes/router.gr.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Go to SECOND'),
              onPressed: () => navigateToSecond(context),
            ),
            SizedBox(height: 5.0),
            RaisedButton(
              child: Text('Go to THIRD'),
              onPressed: () => navigateToThird(context),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSecond(BuildContext context) {
    Router.navigator.pushNamed(Router.secondPage, arguments: 'Unique_user_id');
  }

  void navigateToThird(BuildContext context) {
    Router.navigator.pushNamed(
      Router.thirdPage,
      arguments: ThirdPageArguments(userName: 'aliarabat', points: 20),
    );
  }
}
