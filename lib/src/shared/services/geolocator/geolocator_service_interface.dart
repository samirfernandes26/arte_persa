import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:geolocator/geolocator.dart';

abstract interface class GeolocatorService {
  Future<Either<ServiceException, Position>> execute();
  Future<LocationPermission> checkPermission();
  Future<LocationPermission> requestPermission();
  Future<Position> getPosition();
}
