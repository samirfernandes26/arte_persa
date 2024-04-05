import 'dart:async';
import 'dart:developer';
import 'package:arte_persa/src/core/exceptions/repository_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:arte_persa/src/core/constants/api_keys.dart';
import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/repositories/convert_addresses/convert_addresses_repository.dart';

class ConvertAddressesRepositoryImpl implements ConvertAddressesRepository {
  @override
  Future<Either<RepositoryException, Map<String, dynamic>>>
      convertAddressesToGeolocation({
    required String endereco,
  }) async {
    try {
      final url = Uri.parse(
        '${ApiKeys.baseGeocodingApi}$endereco&${LocalStorageKeys.googleApiKey}',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final dados = json.decode(response.body);

        if (dados['results'].isNotEmpty) {
          final localizacao = dados['results'][0]['geometry']['location'];

          final Map<String, dynamic> coordenadas = {
            "latitude": localizacao['lat'],
            "longitude": localizacao['lng'],
          };

          return Success(coordenadas);
        }
      }

      return Failure(
        RepositoryException(
          message: 'Nenhuma Localiação Encontrada',
        ),
      );
    } catch (error) {
      log(
        error.toString(),
      );
      return Failure(
        RepositoryException(
          message: 'Error ao tentar converter endereço em coordenadas!',
        ),
      );
    }
  }
}
