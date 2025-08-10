import 'package:countries/core/exception/exception.dart';
import 'package:countries/core/exception/failure.dart';
import 'package:countries/core/network/network_info.dart';
import 'package:countries/features/country/data/datasources/country_local_data_source.dart';
import 'package:countries/features/country/data/datasources/country_remote_data_source.dart';
import 'package:countries/features/country/domain/entities/country.dart';
import 'package:countries/features/country/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryLocalDataSource localDataSource;
  final CountryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CountryRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> addToFavorite(Country country) async {
    try {
      // Convert Country to CountryModel if necessary
      final countryModel = country;
      await localDataSource.addToFavorite(countryModel);
      return Right(null);
    } on CacheException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Country>>> loadCountries() async {
    if (await networkInfo.isConnected()) {
      try {
        final result = await remoteDataSource.loadCountries();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Country>>> loadFavorites() async {
    try {
      final favorites = await localDataSource.loadFavorites();
      return Right(favorites);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
