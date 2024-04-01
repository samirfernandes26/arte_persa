import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/services/geolocation/geolocation_service.dart';

class GeolocationServiceImpl implements GeolocationService {
  GeolocationServiceImpl();

  @override
  Future<Either<ServiceException, Position>> execute() async {
    try {
      final permission = await checkPermission();

      if (![LocationPermission.always, LocationPermission.whileInUse]
          .contains(permission)) {
        final permissionStatus = await requestPermission();

        switch (permissionStatus) {
          case (LocationPermission.whileInUse || LocationPermission.always):
            return Success(await Geolocator.getCurrentPosition());
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
        return Success(await Geolocator.getCurrentPosition());
      }
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

  void getCoordinates() async {
    String enderecoCliente = "Rua Exemplo, 123, Bairro, Cidade, Estado, CEP";

    try {
      List<Location> locations = await getLocationFromAddress(enderecoCliente);
      if (locations.isNotEmpty) {
        // TODO Se localização encontrada
      } else {
        print("Localização não encontrada.");
        // TODO Se localização não encontrada
      }
    } catch (error) {
      //TODO Se error na hora de pegar localização
    }
  }

  Future<List<Location>> getLocationFromAddress(String enderecoCliente) async {
    try {
      List<Location> locations = await locationFromAddress(enderecoCliente);
      return locations;
    } catch (e) {
      throw ServiceException(message: 'Erro ao obter localização: $e');
    }
  }
}
