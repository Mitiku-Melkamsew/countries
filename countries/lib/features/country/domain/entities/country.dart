import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String name;
  final String imageUrl;
  final String region;
  final String subregion;
  final int population;
  final int area;
  final List<String> timeZones;

  const Country({
    required this.name,
    required this.imageUrl,
    required this.region,
    required this.subregion,
    required this.population,
    required this.area,
    required this.timeZones,
  });
  @override
  List<Object?> get props => [name];
}
