import 'dart:convert';

import 'package:countries/core/exception/exception.dart';
import 'package:countries/features/country/data/models/country_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/country.dart';

abstract class CountryLocalDataSource {
  Future<void> addToFavorite(Country country);
  Future<List<CountryModel>> loadFavorites();
}

class CountryLocalDataSourceImpl implements CountryLocalDataSource {
  final SharedPreferencesAsync sharedPreference;

  CountryLocalDataSourceImpl({required this.sharedPreference});

  @override
  Future<void> addToFavorite(Country country) async {
    final countryModel = (country as CountryModel).toJson().toString();
    final countryList = await sharedPreference.getStringList('country');
    if (countryList != null) {
      countryList.add(countryModel);
    } else {
      sharedPreference.setStringList('country', [countryModel]);
    }
  }

  @override
  Future<List<CountryModel>> loadFavorites() async {
    final favorites = await sharedPreference.getStringList('country');
    if (favorites != null) {
      return favorites
          .map((string) => CountryModel.fromJson(jsonDecode(string)))
          .toList();
    } else {
      throw CacheException();
    }
  }
}
