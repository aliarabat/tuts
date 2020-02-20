import 'package:mobx/mobx.dart';
import 'package:tuts/tut3/weather_repository.dart';

import 'package:tuts/tut4/city_repository.dart';
import 'package:tuts/tut4/model/city.dart';

part 'city_store.g.dart';

class CityStore extends _CityStore with _$CityStore {
  CityStore(CityRepository cityRepository) : super(cityRepository);
}

enum CityState { initial, loading, loaded }

abstract class _CityStore with Store {
  final CityRepository cityRepository;
  _CityStore(
    this.cityRepository,
  );

  @observable
  ObservableFuture<City> _cityFuture;

  @observable
  City city;

  @observable
  String errorMessage;

  @computed
  CityState get state {
    if (_cityFuture == null || _cityFuture.status == FutureStatus.rejected) {
      return CityState.initial;
    }

    return _cityFuture.status == FutureStatus.pending
        ? CityState.loading
        : CityState.loaded;
  }

  @action
  Future getCity(String cityName) async {
    try {
      errorMessage = null;
      _cityFuture = ObservableFuture(cityRepository.fetchCityInfos(cityName));
      city = await _cityFuture;
    } on NetworkError {
      errorMessage = "Oops no résultat exists";
    }
  }
}
