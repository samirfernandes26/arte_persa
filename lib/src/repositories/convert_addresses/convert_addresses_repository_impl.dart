import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arte_persa/src/core/constants/api_keys.dart';
import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/repositories/convert_addresses/convert_addresses_repository.dart';

class ConvertAddressesRepositoryImpl implements ConvertAddressesRepository {
  @override
  Future<Map<String, dynamic>> convertAddressesToGeolocation(
      {required String endereco}) async {
    Uri url = _constructGeocodingURL(endereco);

    try {
      http.Response response = await http.get(url);
      return _processResponse(response);
    } catch (e) {
      return _emptyCoordinates();
    }
  }

  Uri _constructGeocodingURL(String endereco) {
    return Uri.parse(
        '${ApiKeys.baseGeocodingApi}$endereco&${LocalStorageKeys.googleApiKey}');
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['results'].isNotEmpty) {
        return _extractCoordinates(data);
      }
    }
    return _emptyCoordinates();
  }

  Map<String, dynamic> _extractCoordinates(Map<String, dynamic> data) {
    final location = data['results'][0]['geometry']['location'];
    return {
      "latitude": location['lat'],
      "longitude": location['lng'],
    };
  }

  Map<String, dynamic> _emptyCoordinates() {
    return {"latitude": null, "longitude": null};
  }
}
