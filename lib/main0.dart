import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuts/tut4/city_repository.dart';
import 'package:tuts/tut4/city_store.dart';
import 'package:tuts/tut4/pages/city_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/',
      // onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: Router.initialPage,
      // onGenerateRoute: Router.onGenerateRoute,
      // navigatorKey: Router.navigatorKey,
      home: Provider(
        // create: (_) => WeatherStore(FakeWeatherRepository()),
        // child: WeatherSearchPage(),
        create: (_) => CityStore(FileCityRepository()),
        child: CitySearchPage(),
      ),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  ScrollController _scrollController;
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    this._scrollController = new ScrollController();
    this._animationController = AnimationController(
        vsync: this, duration: kThemeAnimationDuration, value: 1);
    this._scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          this._animationController.forward();
          break;
        case ScrollDirection.reverse:
          this._animationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          for (var i = 0; i < 5; i++)
            Card(
              child: FittedBox(
                child: FlutterLogo(),
              ),
              margin: EdgeInsets.all(10),
              elevation: 10.0,
            ),
        ],
      ),
      floatingActionButton: FadeTransition(
        opacity: _animationController,
        child: ScaleTransition(
          scale: _animationController,
          child: FloatingActionButton.extended(
            label: Text("Animated floating button"),
            onPressed: () => {},
            backgroundColor: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}*/
