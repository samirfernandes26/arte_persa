import 'factory_helpers.dart';

sealed class FaturaModelFactory {
  static FaturaModel make({
    String? id,
    String? ordemServicoId,
    String? numero,
    String? criadoPorId,
    String? atualizadoPorId,
    StatusFaturaModel? status,
    DateTime? emitidaEm,
    DateTime? vencimentoEm,
    DateTime? pagaEm,
    MetodoPagamentoModel? metodoPagamento,
    String? valorSubtotal,
    String? valorDesconto,
    String? valorImpostos,
    String? valorTotal,
    String? observacoes,
    String? chavePdf,
    String? urlPdf,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    List<ObservacaoModel>? observacoesRelacionadas,
    List<IntencaoUploadModel>? intencoesUpload,
  }) {
    final model = FaturaModel(
      id: id ?? makeFakeId(),
      ordemServicoId: ordemServicoId ?? makeFakeId(),
      numero: numero ?? makeFakeCode(prefix: 'FAT'),
      criadoPorId: criadoPorId ?? makeFakeId(),
      atualizadoPorId: atualizadoPorId ?? makeFakeId(),
      status: status ?? makeFakeEnum(StatusFaturaModel.values),
      emitidaEm: emitidaEm ?? makeFakeDateTime(),
      vencimentoEm: vencimentoEm ?? makeFakeFutureDateTime(),
      pagaEm: pagaEm ?? makeFakeDateTime(),
      metodoPagamento:
          metodoPagamento ?? makeFakeEnum(MetodoPagamentoModel.values),
      valorSubtotal: valorSubtotal ?? makeFakeMoney(),
      valorDesconto: valorDesconto ?? makeFakeMoney(),
      valorImpostos: valorImpostos ?? makeFakeMoney(),
      valorTotal: valorTotal ?? makeFakeMoney(),
      observacoes: observacoes ?? faker.lorem.sentence(),
      chavePdf: chavePdf ?? makeFakeStorageKey(),
      urlPdf: urlPdf ?? faker.internet.httpsUrl(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      ordemServico: ordemServico,
      criadoPor: criadoPor,
      atualizadoPor: atualizadoPor,
      observacoesRelacionadas: observacoesRelacionadas,
      intencoesUpload: intencoesUpload,
    );

    return model;
  }
}
