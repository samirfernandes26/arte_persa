import 'package:drift/drift.dart';
import 'package:device_client_information/device_client_information.dart';

part 'arquivo_dao.g.dart';

@DriftAccessor()
class ArquivoDao extends DatabaseAccessor<Database> with _$ArquivoDaoMixin {
  ArquivoDao(super.db);

  Future<List<ArquivoModel>> getArquivosModelByCdsId({
    required int cdsId,
    required String cdsTipo,
  }) {}

  Future<List<Arquivo>> getArquivosByCdsId({
    required int cdsId,
    required String cdsTipo,
  }) {}
}
