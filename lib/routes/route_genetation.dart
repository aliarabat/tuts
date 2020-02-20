import 'package:flutter/material.dart';
import 'package:tuts/tut2/first_page.dart';
import 'package:tuts/tut2/second_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    String args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(
              data: args,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
            backgroundColor: Colors.red[600],
          ),
          body: Center(
            child: Text('Errrrrror'),
          ),
        );
      },
    );
  }
}
