import 'factory_helpers.dart';

sealed class ClienteModelFactory {
  static ClienteModel make({
    String? id,
    TipoPessoaClienteModel? tipoPessoa,
    String? documento,
    String? nomeRazaoSocial,
    String? nomeFantasiaApelido,
    String? emailPrincipal,
    String? telefonePrincipal,
    String? observacoesInternas,
    String? criadoPorId,
    String? atualizadoPorId,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    List<ContatoClienteModel>? contatos,
    List<EnderecoClienteModel>? enderecos,
    List<ArquivoClienteModel>? arquivos,
    List<OrdemServicoModel>? ordensServico,
    List<ObservacaoModel>? observacoes,
    List<IntencaoUploadModel>? intencoesUpload,
  }) {
    final model = ClienteModel(
      id: id ?? makeFakeId(),
      tipoPessoa: tipoPessoa ?? makeFakeEnum(TipoPessoaClienteModel.values),
      documento: documento ?? makeFakeDocumento(),
      nomeRazaoSocial: nomeRazaoSocial ?? faker.company.name(),
      nomeFantasiaApelido:
          nomeFantasiaApelido ?? faker.lorem.words(2).join(' '),
      emailPrincipal: emailPrincipal ?? faker.internet.email(),
      telefonePrincipal: telefonePrincipal ?? makeFakePhoneNumber(),
      observacoesInternas: observacoesInternas ?? faker.lorem.sentence(),
      criadoPorId: criadoPorId ?? makeFakeId(),
      atualizadoPorId: atualizadoPorId ?? makeFakeId(),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      criadoPor: criadoPor,
      atualizadoPor: atualizadoPor,
      contatos: contatos,
      enderecos: enderecos,
      arquivos: arquivos,
      ordensServico: ordensServico,
      observacoes: observacoes,
      intencoesUpload: intencoesUpload,
    );

    return model;
  }
}
