import 'factory_helpers.dart';

sealed class ServicoExecutadoItemModelFactory {
  static ServicoExecutadoItemModel make({
    String? id,
    String? itemOrdemServicoId,
    String? servicoCatalogoId,
    String? nomeServicoSnapshot,
    String? categoriaServicoSnapshot,
    UnidadeCobrancaServicoModel? unidadeCobrancaSnapshot,
    String? valorUnitarioSnapshot,
    String? quantidade,
    String? valorDesconto,
    String? valorTotal,
    String? observacoes,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ItemOrdemServicoModel? itemOrdemServico,
    ServicoCatalogoModel? servicoCatalogo,
  }) {
    final model = ServicoExecutadoItemModel(
      id: id ?? makeFakeId(),
      itemOrdemServicoId: itemOrdemServicoId ?? makeFakeId(),
      servicoCatalogoId: servicoCatalogoId ?? makeFakeId(),
      nomeServicoSnapshot:
          nomeServicoSnapshot ?? faker.lorem.words(2).join(' '),
      categoriaServicoSnapshot: categoriaServicoSnapshot ?? faker.lorem.word(),
      unidadeCobrancaSnapshot: unidadeCobrancaSnapshot ??
          makeFakeEnum(UnidadeCobrancaServicoModel.values),
      valorUnitarioSnapshot: valorUnitarioSnapshot ?? makeFakeMoney(),
      quantidade: quantidade ?? makeFakeDecimalString(),
      valorDesconto: valorDesconto ?? makeFakeMoney(),
      valorTotal: valorTotal ?? makeFakeMoney(),
      observacoes: observacoes ?? faker.lorem.sentence(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      itemOrdemServico: itemOrdemServico,
      servicoCatalogo: servicoCatalogo,
    );

    return model;
  }
}
