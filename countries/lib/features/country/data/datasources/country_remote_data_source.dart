import 'dart:convert';

import 'package:countries/core/exception/exception.dart';
import 'package:countries/features/country/data/models/country_model.dart';
import 'package:http/http.dart' as http;

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> loadCountries();
}

  const baseUrl = 'https://restcountries.com/v3.1/independent?status=true&fields=name,population,flag,area,region,subregion,timezones,flags';
class CountryRemoteDataSourceImpl implements CountryRemoteDataSource{
  final http.Client client;

  CountryRemoteDataSourceImpl({required this.client});
  @override
  Future<List<CountryModel>> loadCountries() async {
    final response = await client.get(Uri.parse(baseUrl), headers: {'content-type':'application/json'});
    if (response.statusCode == 200){
      final List<dynamic> countryList = jsonDecode(response.body);
      return countryList.map((json) => CountryModel.fromJson(json)).toList();
    }else{
      throw ServerException();
    }
  }
}