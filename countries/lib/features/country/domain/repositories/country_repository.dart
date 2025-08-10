
import 'package:dartz/dartz.dart';

import '../../../../core/exception/failure.dart';
import '../entities/country.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<Country>>> loadCountries();
  Future<Either<Failure, void>> addToFavorite(Country country);
  Future<Either<Failure, List<Country>>> loadFavorites();
}