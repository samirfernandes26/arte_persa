import 'factory_helpers.dart';

sealed class TokenRefreshModelFactory {
  static TokenRefreshModel make({
    String? id,
    String? usuarioId,
    String? familiaToken,
    DateTime? expiraEm,
    DateTime? revogadoEm,
    String? ipOrigem,
    String? agenteUsuario,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    UsuarioModel? usuario,
  }) {
    final model = TokenRefreshModel(
      id: id ?? makeFakeId(),
      usuarioId: usuarioId ?? makeFakeId(),
      familiaToken: familiaToken ?? makeFakeId(),
      expiraEm: expiraEm ?? makeFakeFutureDateTime(),
      revogadoEm: revogadoEm,
      ipOrigem: ipOrigem ?? faker.internet.ipv4Address(),
      agenteUsuario: agenteUsuario ?? faker.internet.userAgent(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      usuario: usuario,
    );

    return model;
  }
}
