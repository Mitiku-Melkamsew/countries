import 'package:equatable/equatable.dart';

abstract class Exception extends Equatable {}

class ServerException extends Exception {
  @override
  List<Object?> get props => [];
}

class CacheException extends Exception {
  @override
  List<Object?> get props => [];
}
