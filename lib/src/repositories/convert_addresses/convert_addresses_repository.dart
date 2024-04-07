abstract class ConvertAddressesRepository {
  Future<Map<String, dynamic>> convertAddressesToGeolocation({
    required String endereco,
  });
}
