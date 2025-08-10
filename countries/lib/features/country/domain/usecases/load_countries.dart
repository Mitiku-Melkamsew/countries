
import 'package:countries/core/exception/failure.dart';
import 'package:countries/features/country/domain/entities/country.dart';
import 'package:dartz/dartz.dart';

import '../repositories/country_repository.dart';

class LoadCountries {
  final CountryRepository repository;

  LoadCountries({required this.repository});
  Future<Either<Failure, List<Country>>> call() async{
    return repository.loadCountries();
  }
}