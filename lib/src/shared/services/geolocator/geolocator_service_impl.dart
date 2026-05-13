import 'dart:async';
import 'dart:developer';

import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:geolocator/geolocator.dart';
import 'package:arte_persa/src/shared/services/geolocator/geolocator_service_interface.dart';

class GeolocatorServiceImpl implements GeolocatorService {
  GeolocatorServiceImpl();

  @override
  Future<Either<ServiceException, Position>> execute() async {
    try {
      Future<Position> getPositionOrThrow() async {
        try {
          return Geolocator.getCurrentPosition();
        } catch (e) {
          throw ServiceException(
            message: 'Não conseguimos acessar a localização.',
          );
        }
      }

      final permission = await checkPermission();

      if (![LocationPermission.always, LocationPermission.whileInUse]
          .contains(permission)) {
        final permissionStatus = await requestPermission();

        switch (permissionStatus) {
          case (LocationPermission.whileInUse || LocationPermission.always):
            return Success(await getPositionOrThrow());
          case LocationPermission.denied:
            throw ServiceException(message: 'Habilite sua localização');
          case LocationPermission.deniedForever:
            await Geolocator.openAppSettings();
            throw ServiceException(
                message:
                    'É necessário habilitar a permissão de localização manualmente nas configurações do aplicativo.');
          case LocationPermission.unableToDetermine:
            throw ServiceException(
                message: 'Não foi possível solicitar a permissão.');
        }
      } else {
        return Success(await getPositionOrThrow());
      }
    } on LocationServiceDisabledException catch (_, s) {
      log('GeolocationServiceImpl:execute', error: _, stackTrace: s);

      return Failure(
        ServiceException(message: 'Não conseguimos acessar a localização.'),
      );
    } on ServiceException catch (e, s) {
      log('GeolocationServiceImpl:execute', error: e, stackTrace: s);

      return Failure(
        ServiceException(message: e.message),
      );
    } on Exception catch (e, s) {
      log('GeolocationServiceImpl:execute', error: e, stackTrace: s);

      return Failure(
        ServiceException(message: 'Não foi possível obter a localização'),
      );
    }
  }

  @override
  Future<LocationPermission> checkPermission() async {
    return Geolocator.checkPermission();
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return Geolocator.requestPermission();
  }

  @override
  Future<Position> getPosition() async {
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }
}
