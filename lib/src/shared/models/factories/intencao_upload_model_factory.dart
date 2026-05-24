import 'factory_helpers.dart';

sealed class IntencaoUploadModelFactory {
  static IntencaoUploadModel make({
    String? id,
    String? chaveS3,
    String? bucket,
    String? tipoDestino,
    String? nomeArquivo,
    String? tipoMime,
    String? ordemServicoId,
    String? itemOrdemServicoId,
    String? clienteId,
    String? faturaId,
    String? usuarioSolicitanteId,
    DateTime? confirmadoEm,
    DateTime? expiraEm,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    ItemOrdemServicoModel? itemOrdemServico,
    ClienteModel? cliente,
    FaturaModel? fatura,
    UsuarioModel? usuarioSolicitante,
  }) {
    final model = IntencaoUploadModel(
      id: id ?? makeFakeId(),
      chaveS3: chaveS3 ?? makeFakeStorageKey(),
      bucket: bucket ??
          faker.randomGenerator
              .element(['arte-persa', 'uploads', 'documentos']),
      tipoDestino: tipoDestino ?? faker.lorem.word(),
      nomeArquivo: nomeArquivo ?? makeFakeFileName(),
      tipoMime: tipoMime ?? makeFakeMimeType(),
      ordemServicoId: ordemServicoId ?? makeFakeId(),
      itemOrdemServicoId: itemOrdemServicoId ?? makeFakeId(),
      clienteId: clienteId ?? makeFakeId(),
      faturaId: faturaId ?? makeFakeId(),
      usuarioSolicitanteId: usuarioSolicitanteId ?? makeFakeId(),
      confirmadoEm: confirmadoEm ?? makeFakeDateTime(),
      expiraEm: expiraEm ?? makeFakeFutureDateTime(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      ordemServico: ordemServico,
      itemOrdemServico: itemOrdemServico,
      cliente: cliente,
      fatura: fatura,
      usuarioSolicitante: usuarioSolicitante,
    );

    return model;
  }
}
