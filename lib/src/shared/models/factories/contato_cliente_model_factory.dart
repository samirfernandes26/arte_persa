import 'factory_helpers.dart';

sealed class ContatoClienteModelFactory {
  static ContatoClienteModel make({
    String? id,
    String? clienteId,
    String? criadoPorId,
    String? atualizadoPorId,
    String? nome,
    String? setor,
    String? cargo,
    TipoContatoClienteModel? tipoContato,
    String? valor,
    bool? principal,
    String? observacoes,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ClienteModel? cliente,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
  }) {
    final model = ContatoClienteModel(
      id: id ?? makeFakeId(),
      clienteId: clienteId ?? makeFakeId(),
      criadoPorId: criadoPorId ?? makeFakeId(),
      atualizadoPorId: atualizadoPorId ?? makeFakeId(),
      nome: nome ?? faker.person.name(),
      setor: setor ?? faker.lorem.sentence(),
      cargo: cargo ?? faker.lorem.sentence(),
      tipoContato: tipoContato ?? makeFakeEnum(TipoContatoClienteModel.values),
      valor: valor ?? makeFakePhoneNumber(),
      principal: principal ?? faker.randomGenerator.boolean(),
      observacoes: observacoes ?? faker.lorem.sentence(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      cliente: cliente,
      criadoPor: criadoPor,
      atualizadoPor: atualizadoPor,
    );

    return model;
  }
}
