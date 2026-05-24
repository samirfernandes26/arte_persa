import 'factory_helpers.dart';

sealed class ArquivoClienteModelFactory {
  static ArquivoClienteModel make({
    String? id,
    String? clienteId,
    String? criadoPorId,
    String? chaveS3,
    String? urlArquivo,
    String? nomeArquivo,
    String? tipoMime,
    int? tamanhoBytes,
    String? rotulo,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ClienteModel? cliente,
    UsuarioModel? criadoPor,
  }) {
    final model = ArquivoClienteModel(
      id: id ?? makeFakeId(),
      clienteId: clienteId ?? makeFakeId(),
      criadoPorId: criadoPorId ?? makeFakeId(),
      chaveS3: chaveS3 ?? makeFakeStorageKey(),
      urlArquivo: urlArquivo ?? faker.internet.httpsUrl(),
      nomeArquivo: nomeArquivo ?? makeFakeFileName(),
      tipoMime: tipoMime ?? makeFakeMimeType(),
      tamanhoBytes:
          tamanhoBytes ?? faker.randomGenerator.integer(5000000, min: 1024),
      rotulo: rotulo ?? faker.lorem.sentence(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      cliente: cliente,
      criadoPor: criadoPor,
    );

    return model;
  }
}
