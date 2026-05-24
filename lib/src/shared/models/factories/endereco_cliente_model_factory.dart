import 'factory_helpers.dart';

sealed class EnderecoClienteModelFactory {
  static EnderecoClienteModel make({
    String? id,
    String? clienteId,
    String? criadoPorId,
    String? atualizadoPorId,
    TipoEnderecoClienteModel? tipoEndereco,
    String? rotulo,
    String? destinatario,
    String? cep,
    String? logradouro,
    String? numero,
    String? complemento,
    String? bairro,
    String? cidade,
    String? estado,
    String? pais,
    String? referencia,
    bool? principal,
    String? latitude,
    String? longitude,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ClienteModel? cliente,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
  }) {
    final model = EnderecoClienteModel(
      id: id ?? makeFakeId(),
      clienteId: clienteId ?? makeFakeId(),
      criadoPorId: criadoPorId ?? makeFakeId(),
      atualizadoPorId: atualizadoPorId ?? makeFakeId(),
      tipoEndereco:
          tipoEndereco ?? makeFakeEnum(TipoEnderecoClienteModel.values),
      rotulo: rotulo ?? faker.lorem.sentence(),
      destinatario: destinatario ?? faker.person.name(),
      cep: cep ?? makeFakeCep(),
      logradouro: logradouro ?? faker.address.streetName(),
      numero: numero ?? faker.address.buildingNumber(),
      complemento: complemento ?? faker.lorem.word(),
      bairro: bairro ?? faker.address.neighborhood(),
      cidade: cidade ?? faker.address.city(),
      estado: estado ?? faker.address.state(),
      pais: pais ?? 'Brasil',
      referencia: referencia ?? faker.lorem.sentence(),
      principal: principal ?? faker.randomGenerator.boolean(),
      latitude: latitude ?? makeFakeLatitude(),
      longitude: longitude ?? makeFakeLongitude(),
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
