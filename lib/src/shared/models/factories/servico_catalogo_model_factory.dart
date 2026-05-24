import 'factory_helpers.dart';

sealed class ServicoCatalogoModelFactory {
  static ServicoCatalogoModel make({
    String? id,
    String? nome,
    String? descricao,
    String? categoria,
    String? precoBase,
    UnidadeCobrancaServicoModel? unidadeCobranca,
    int? prazoMedioDias,
    String? criadoPorId,
    String? atualizadoPorId,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    List<ServicoExecutadoItemModel>? servicosExecutadosItem,
  }) {
    final model = ServicoCatalogoModel(
      id: id ?? makeFakeId(),
      nome: nome ?? faker.lorem.words(2).join(' '),
      descricao: descricao ?? faker.lorem.sentence(),
      categoria: categoria ?? faker.lorem.word(),
      precoBase: precoBase ?? makeFakeMoney(),
      unidadeCobranca:
          unidadeCobranca ?? makeFakeEnum(UnidadeCobrancaServicoModel.values),
      prazoMedioDias:
          prazoMedioDias ?? faker.randomGenerator.integer(10, min: 1),
      criadoPorId: criadoPorId ?? makeFakeId(),
      atualizadoPorId: atualizadoPorId ?? makeFakeId(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      criadoPor: criadoPor,
      atualizadoPor: atualizadoPor,
      servicosExecutadosItem: servicosExecutadosItem,
    );

    return model;
  }
}
