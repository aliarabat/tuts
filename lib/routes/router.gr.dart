// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:tuts/tut1/initial_page.dart';
import 'package:tuts/tut1/second_page.dart';
import 'package:tuts/tut1/third_page.dart';
import 'package:auto_route/transitions_builders.dart';

class Router {
  static const initialPage = '/';
  static const secondPage = '/second-page';
  static const thirdPage = '/third-page';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.initialPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => InitialPage(key: typedArgs),
          settings: settings,
        );
      case Router.secondPage:
        if (hasInvalidArgs<String>(args, isRequired: true)) {
          return misTypedArgsRoute<String>(args);
        }
        final typedArgs = args as String;
        return CupertinoPageRoute(
          builder: (_) => SecondPage(userId: typedArgs),
          settings: settings,
          fullscreenDialog: true,
        );
      case Router.thirdPage:
        if (hasInvalidArgs<ThirdPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ThirdPageArguments>(args);
        }
        final typedArgs = args as ThirdPageArguments;
        return PageRouteBuilder(
          pageBuilder: (ctx, animation, secondaryAnimation) => ThirdPage(
              key: typedArgs.key,
              userName: typedArgs.userName,
              points: typedArgs.points),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          transitionDuration: Duration(milliseconds: 200),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//ThirdPage arguments holder class
class ThirdPageArguments {
  final Key key;
  final String userName;
  final int points;
  ThirdPageArguments(
      {this.key, @required this.userName, @required this.points});
}
