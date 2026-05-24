import 'factory_helpers.dart';

sealed class ImagemObservacaoModelFactory {
  static ImagemObservacaoModel make({
    String? id,
    String? observacaoId,
    String? criadoPorId,
    String? atualizadoPorId,
    String? chaveS3,
    String? urlArquivo,
    String? nomeArquivo,
    String? tipoMime,
    int? tamanhoBytes,
    int? posicao,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ObservacaoModel? observacao,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
  }) {
    final model = ImagemObservacaoModel(
      id: id ?? makeFakeId(),
      observacaoId: observacaoId ?? makeFakeId(),
      criadoPorId: criadoPorId ?? makeFakeId(),
      atualizadoPorId: atualizadoPorId ?? makeFakeId(),
      chaveS3: chaveS3 ?? makeFakeStorageKey(),
      urlArquivo: urlArquivo ?? faker.internet.httpsUrl(),
      nomeArquivo: nomeArquivo ?? makeFakeFileName(),
      tipoMime: tipoMime ?? makeFakeMimeType(),
      tamanhoBytes:
          tamanhoBytes ?? faker.randomGenerator.integer(5000000, min: 1024),
      posicao: posicao ?? faker.randomGenerator.integer(10, min: 1),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      observacao: observacao,
      criadoPor: criadoPor,
      atualizadoPor: atualizadoPor,
    );

    return model;
  }
}
