import 'factory_helpers.dart';

sealed class ObservacaoModelFactory {
  static ObservacaoModel make({
    String? id,
    TipoAlvoObservacaoModel? tipoAlvo,
    String? ordemServicoId,
    String? itemOrdemServicoId,
    String? clienteId,
    String? faturaId,
    String? criadoPorId,
    String? atualizadoPorId,
    VisibilidadeObservacaoModel? visibilidade,
    String? titulo,
    String? conteudo,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    ItemOrdemServicoModel? itemOrdemServico,
    ClienteModel? cliente,
    FaturaModel? fatura,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    List<ImagemObservacaoModel>? imagens,
  }) {
    final TipoAlvoObservacaoModel resolvedTipoAlvo = tipoAlvo ??
        (ordemServicoId != null
            ? TipoAlvoObservacaoModel.ordemServico
            : itemOrdemServicoId != null
                ? TipoAlvoObservacaoModel.itemOrdemServico
                : clienteId != null
                    ? TipoAlvoObservacaoModel.cliente
                    : faturaId != null
                        ? TipoAlvoObservacaoModel.fatura
                        : makeFakeEnum(TipoAlvoObservacaoModel.values));

    final resolvedOrdemServicoId =
        resolvedTipoAlvo == TipoAlvoObservacaoModel.ordemServico
            ? ordemServicoId ?? makeFakeId()
            : null;
    final resolvedItemOrdemServicoId =
        resolvedTipoAlvo == TipoAlvoObservacaoModel.itemOrdemServico
            ? itemOrdemServicoId ?? makeFakeId()
            : null;
    final resolvedClienteId =
        resolvedTipoAlvo == TipoAlvoObservacaoModel.cliente
            ? clienteId ?? makeFakeId()
            : null;
    final resolvedFaturaId = resolvedTipoAlvo == TipoAlvoObservacaoModel.fatura
        ? faturaId ?? makeFakeId()
        : null;

    final model = ObservacaoModel(
      id: id ?? makeFakeId(),
      tipoAlvo: resolvedTipoAlvo,
      ordemServicoId: resolvedOrdemServicoId,
      itemOrdemServicoId: resolvedItemOrdemServicoId,
      clienteId: resolvedClienteId,
      faturaId: resolvedFaturaId,
      criadoPorId: criadoPorId ?? makeFakeId(),
      atualizadoPorId: atualizadoPorId ?? makeFakeId(),
      visibilidade:
          visibilidade ?? makeFakeEnum(VisibilidadeObservacaoModel.values),
      titulo: titulo ?? faker.lorem.sentence(),
      conteudo: conteudo ?? faker.lorem.sentence(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      ordemServico: ordemServico,
      itemOrdemServico: itemOrdemServico,
      cliente: cliente,
      fatura: fatura,
      criadoPor: criadoPor,
      atualizadoPor: atualizadoPor,
      imagens: imagens,
    );

    return model;
  }
}
