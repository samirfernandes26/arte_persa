import 'package:geolocator/geolocator.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';

abstract interface class GeolocationService {
  Future<Either<ServiceException, Position>> execute();
  Future<LocationPermission> checkPermission();
  Future<LocationPermission> requestPermission();
  Future<Position> getPosition();
}
