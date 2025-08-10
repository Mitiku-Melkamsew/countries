
import 'package:countries/core/exception/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/country.dart';
import '../repositories/country_repository.dart';

class AddToFavorite {
  final CountryRepository repository;

  AddToFavorite({required this.repository});
  Future<Either<Failure, void>> call(Country country){
    return repository.addToFavorite(country);
  }

}