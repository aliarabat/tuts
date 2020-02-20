import 'dart:convert';
import 'dart:io';

import 'package:tuts/tut4/model/city.dart';

abstract class CityRepository {
  Future<City> fetchCityInfos(String cityName);
}

class FileCityRepository implements CityRepository {
  @override
  Future<City> fetchCityInfos(String cityName) {
    return Future.delayed(
      Duration(milliseconds: 800),
      () {
        return _getCity(cityName);
      },
    );
  }

  City _getCity(String cityName) {
    // var f;
    // try {
    //   f = File('cities.json');
    // } on FileSystemException {
    //   return null;
    // }
    var city = City(22, cityName, "Morocco");
    // List<dynamic> data = json.decode(f.readAsStringSync());

    // data.forEach((c) {
    //   if (c['name'] == cityName) {
    //     return City(c['id'], c['name'], c['country']);
    //   }
    // });
    return city;
  }
}
