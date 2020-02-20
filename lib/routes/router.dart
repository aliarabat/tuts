import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/transitions_builders.dart';
import 'package:tuts/tut1/initial_page.dart';
import 'package:tuts/tut1/second_page.dart';
import 'package:tuts/tut1/third_page.dart';

@autoRouter
class $Router {
  @initial
  InitialPage initialPage;
  @CupertinoRoute(fullscreenDialog: true)
  SecondPage secondPage;
  @CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 200)
  ThirdPage thirdPage;
}
