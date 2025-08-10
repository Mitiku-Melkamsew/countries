import 'package:countries/features/country/domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({
    required super.name,
    required super.imageUrl,
    required super.region,
    required super.subregion,
    required super.population,
    required super.area,
    required super.timeZones,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    final countryModel = CountryModel(
      name: json['name']['common'],
      imageUrl: json['flags']['png'],
      region: json['region'],
      subregion: json['subregion'],
      population: json['population'],
      area: json['area'],
      timeZones: json['timeZones'],
    );
    return countryModel;
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'flags': imageUrl,
      'region': region,
      'subregion': subregion,
      'population': population,
      'area': area,
      'timeZones': timeZones,
    };
  }
}
