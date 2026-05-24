import 'factory_helpers.dart';

sealed class ImagemOrdemServicoModelFactory {
  static ImagemOrdemServicoModel make({
    String? id,
    String? ordemServicoId,
    String? criadoPorId,
    String? chaveS3,
    String? urlArquivo,
    String? nomeArquivo,
    String? tipoMime,
    int? tamanhoBytes,
    int? ordemExibicao,
    String? rotulo,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    UsuarioModel? criadoPor,
  }) {
    final model = ImagemOrdemServicoModel(
      id: id ?? makeFakeId(),
      ordemServicoId: ordemServicoId ?? makeFakeId(),
      criadoPorId: criadoPorId ?? makeFakeId(),
      chaveS3: chaveS3 ?? makeFakeStorageKey(),
      urlArquivo: urlArquivo ?? faker.internet.httpsUrl(),
      nomeArquivo: nomeArquivo ?? makeFakeFileName(),
      tipoMime: tipoMime ?? makeFakeMimeType(),
      tamanhoBytes:
          tamanhoBytes ?? faker.randomGenerator.integer(5000000, min: 1024),
      ordemExibicao: ordemExibicao ?? faker.randomGenerator.integer(10, min: 1),
      rotulo: rotulo ?? faker.lorem.sentence(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      ordemServico: ordemServico,
      criadoPor: criadoPor,
    );

    return model;
  }
}
