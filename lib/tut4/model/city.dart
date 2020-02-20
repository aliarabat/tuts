import 'dart:convert';

import 'dart:io';

class City implements Comparable<City> {
  final int id;
  final String name;
  final String country;

  City(
    this.id,
    this.name,
    this.country,
  );

  City copyWith({
    int id,
    String name,
    String country,
  }) {
    return City(
      id ?? this.id,
      name ?? this.name,
      country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country': country,
    };
  }

  static City fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return City(
      map['id'],
      map['name'],
      map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  static City fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => '{City id: $id, name: $name, country: $country}';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is City && o.id == id && o.name == name && o.country == country;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ country.hashCode;

  @override
  int compareTo(City other) {
    return this.name.compareTo(other.name);
  }
}
