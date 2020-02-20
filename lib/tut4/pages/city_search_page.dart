import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:tuts/tut4/city_store.dart';
import 'package:tuts/tut4/model/city.dart';

class CitySearchPage extends StatefulWidget {
  CitySearchPage({Key key}) : super(key: key);

  @override
  _CitySearchPageState createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  CityStore _cityStore;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this._cityStore ??= Provider.of<CityStore>(context);
    this._disposers = [
      reaction(
        (_) => _cityStore.errorMessage,
        (String errorMessage) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(
                errorMessage,
              ),
            ),
          );
        },
      ),
    ];
  }

  Widget _buildLoadingIndicater() {
    return CircularProgressIndicator(
    );
  }

  Widget _buildSearchInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        onSubmitted: (String cityName) => _submitCityName(context, cityName),
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Enter a city name',
          prefixIcon: Icon(Icons.search),
          fillColor: Colors.deepPurple,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnData(City city) {
    final TextStyle _style = TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Id is ${city.id}',
          style: _style,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Name is ${city.name}',
          style: _style,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Country is ${city.country}',
          style: _style,
        ),
        SizedBox(
          height: 5.0,
        ),
        _buildSearchInput()
      ],
    );
  }

  void _submitCityName(BuildContext context, String cityName) {
    final cityStore = Provider.of<CityStore>(context);
    cityStore.getCity(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('City App'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            switch (_cityStore.state) {
              case CityState.initial:
                return _buildSearchInput();
              case CityState.loading:
                return _buildLoadingIndicater();
              case CityState.loaded:
                return _buildColumnData(_cityStore.city);
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d.call());
    super.dispose();
  }
}
