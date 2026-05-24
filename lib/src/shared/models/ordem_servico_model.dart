// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'canal_entrada_ordem_servico_model.dart';
import 'cliente_model.dart';
import 'decimal_json_converter.dart';
import 'enum_json_converters.dart';
import 'fatura_model.dart';
import 'historico_status_ordem_servico_model.dart';
import 'imagem_ordem_servico_model.dart';
import 'intencao_upload_model.dart';
import 'item_ordem_servico_model.dart';
import 'observacao_model.dart';
import 'status_ordem_servico_model.dart';
import 'usuario_model.dart';

part 'ordem_servico_model.g.dart';

/// Cabecalho da ordem de servico e seus dados operacionais principais.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class OrdemServicoModel {
  final String id;
  final String codigo;
  @JsonKey(name: 'cliente_id')
  final String clienteId;
  @JsonKey(name: 'criado_por_id')
  final String criadoPorId;
  @JsonKey(name: 'atualizado_por_id')
  final String? atualizadoPorId;
  @JsonKey(name: 'responsavel_id')
  final String? responsavelId;
  @JsonKey(name: 'aprovado_por_desconto_id')
  final String? aprovadoPorDescontoId;
  @StatusOrdemServicoModelConverter()
  final StatusOrdemServicoModel status;
  @JsonKey(name: 'canal_entrada')
  @CanalEntradaOrdemServicoModelConverter()
  final CanalEntradaOrdemServicoModel canalEntrada;
  @JsonKey(name: 'agendada_coleta_em')
  final DateTime? agendadaColetaEm;
  @JsonKey(name: 'agendada_entrega_em')
  final DateTime? agendadaEntregaEm;
  @JsonKey(name: 'iniciada_em')
  final DateTime? iniciadaEm;
  @JsonKey(name: 'finalizada_em')
  final DateTime? finalizadaEm;
  @JsonKey(name: 'cancelada_em')
  final DateTime? canceladaEm;
  @JsonKey(name: 'snapshot_endereco_coleta', includeToJson: false)
  final Map<String, dynamic>? snapshotEnderecoColeta;
  @JsonKey(name: 'snapshot_endereco_entrega', includeToJson: false)
  final Map<String, dynamic>? snapshotEnderecoEntrega;
  @JsonKey(name: 'snapshot_cliente', includeToJson: false)
  final Map<String, dynamic>? snapshotCliente;
  @JsonKey(name: 'snapshot_politica_desconto', includeToJson: false)
  final Map<String, dynamic>? snapshotPoliticaDesconto;
  @JsonKey(name: 'percentual_desconto')
  @DecimalJsonConverter()
  final String percentualDesconto;
  @JsonKey(name: 'valor_desconto')
  @DecimalJsonConverter()
  final String valorDesconto;
  @JsonKey(name: 'valor_frete')
  @DecimalJsonConverter()
  final String valorFrete;
  @JsonKey(name: 'valor_subtotal')
  @DecimalJsonConverter()
  final String valorSubtotal;
  @JsonKey(name: 'valor_total')
  @DecimalJsonConverter()
  final String valorTotal;
  @JsonKey(name: 'motivo_desconto')
  final String? motivoDesconto;
  @JsonKey(name: 'observacoes_internas', includeToJson: false)
  final String? observacoesInternas;
  @JsonKey(name: 'observacoes_cliente')
  final String? observacoesCliente;
  @JsonKey(name: 'chave_assinatura_cliente')
  final String? chaveAssinaturaCliente;
  @JsonKey(name: 'url_assinatura_cliente')
  final String? urlAssinaturaCliente;
  @JsonKey(name: 'assinada_em')
  final DateTime? assinadaEm;
  @JsonKey(name: 'chave_pdf')
  final String? chavePdf;
  @JsonKey(name: 'url_pdf')
  final String? urlPdf;
  final bool ativo;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;
  @JsonKey(includeToJson: false)
  final ClienteModel? cliente;
  @JsonKey(name: 'criado_por', includeToJson: false)
  final UsuarioModel? criadoPor;
  @JsonKey(name: 'atualizado_por', includeToJson: false)
  final UsuarioModel? atualizadoPor;
  @JsonKey(includeToJson: false)
  final UsuarioModel? responsavel;
  @JsonKey(name: 'aprovado_por_desconto', includeToJson: false)
  final UsuarioModel? aprovadoPorDesconto;
  @JsonKey(includeToJson: false)
  final List<ItemOrdemServicoModel>? itens;
  @JsonKey(name: 'historico_status', includeToJson: false)
  final List<HistoricoStatusOrdemServicoModel>? historicoStatus;
  @JsonKey(includeToJson: false)
  final List<ObservacaoModel>? observacoes;
  @JsonKey(includeToJson: false)
  final List<ImagemOrdemServicoModel>? imagens;
  @JsonKey(includeToJson: false)
  final FaturaModel? fatura;
  @JsonKey(name: 'intencoes_upload', includeToJson: false)
  final List<IntencaoUploadModel>? intencoesUpload;

  const OrdemServicoModel({
    required this.id,
    required this.codigo,
    required this.clienteId,
    required this.criadoPorId,
    this.atualizadoPorId,
    this.responsavelId,
    this.aprovadoPorDescontoId,
    required this.status,
    required this.canalEntrada,
    this.agendadaColetaEm,
    this.agendadaEntregaEm,
    this.iniciadaEm,
    this.finalizadaEm,
    this.canceladaEm,
    this.snapshotEnderecoColeta,
    this.snapshotEnderecoEntrega,
    this.snapshotCliente,
    this.snapshotPoliticaDesconto,
    required this.percentualDesconto,
    required this.valorDesconto,
    required this.valorFrete,
    required this.valorSubtotal,
    required this.valorTotal,
    this.motivoDesconto,
    this.observacoesInternas,
    this.observacoesCliente,
    this.chaveAssinaturaCliente,
    this.urlAssinaturaCliente,
    this.assinadaEm,
    this.chavePdf,
    this.urlPdf,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.cliente,
    this.criadoPor,
    this.atualizadoPor,
    this.responsavel,
    this.aprovadoPorDesconto,
    this.itens,
    this.historicoStatus,
    this.observacoes,
    this.imagens,
    this.fatura,
    this.intencoesUpload,
  });

  factory OrdemServicoModel.fromJson(Map<String, dynamic> json) =>
      _$OrdemServicoModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdemServicoModelToJson(this);

  OrdemServicoModel copyWith({
    String? id,
    String? codigo,
    String? clienteId,
    String? criadoPorId,
    String? atualizadoPorId,
    String? responsavelId,
    String? aprovadoPorDescontoId,
    StatusOrdemServicoModel? status,
    CanalEntradaOrdemServicoModel? canalEntrada,
    DateTime? agendadaColetaEm,
    DateTime? agendadaEntregaEm,
    DateTime? iniciadaEm,
    DateTime? finalizadaEm,
    DateTime? canceladaEm,
    Map<String, dynamic>? snapshotEnderecoColeta,
    Map<String, dynamic>? snapshotEnderecoEntrega,
    Map<String, dynamic>? snapshotCliente,
    Map<String, dynamic>? snapshotPoliticaDesconto,
    String? percentualDesconto,
    String? valorDesconto,
    String? valorFrete,
    String? valorSubtotal,
    String? valorTotal,
    String? motivoDesconto,
    String? observacoesInternas,
    String? observacoesCliente,
    String? chaveAssinaturaCliente,
    String? urlAssinaturaCliente,
    DateTime? assinadaEm,
    String? chavePdf,
    String? urlPdf,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ClienteModel? cliente,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    UsuarioModel? responsavel,
    UsuarioModel? aprovadoPorDesconto,
    List<ItemOrdemServicoModel>? itens,
    List<HistoricoStatusOrdemServicoModel>? historicoStatus,
    List<ObservacaoModel>? observacoes,
    List<ImagemOrdemServicoModel>? imagens,
    FaturaModel? fatura,
    List<IntencaoUploadModel>? intencoesUpload,
  }) =>
      OrdemServicoModel(
        id: id ?? this.id,
        codigo: codigo ?? this.codigo,
        clienteId: clienteId ?? this.clienteId,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        atualizadoPorId: atualizadoPorId ?? this.atualizadoPorId,
        responsavelId: responsavelId ?? this.responsavelId,
        aprovadoPorDescontoId:
            aprovadoPorDescontoId ?? this.aprovadoPorDescontoId,
        status: status ?? this.status,
        canalEntrada: canalEntrada ?? this.canalEntrada,
        agendadaColetaEm: agendadaColetaEm ?? this.agendadaColetaEm,
        agendadaEntregaEm: agendadaEntregaEm ?? this.agendadaEntregaEm,
        iniciadaEm: iniciadaEm ?? this.iniciadaEm,
        finalizadaEm: finalizadaEm ?? this.finalizadaEm,
        canceladaEm: canceladaEm ?? this.canceladaEm,
        snapshotEnderecoColeta:
            snapshotEnderecoColeta ?? this.snapshotEnderecoColeta,
        snapshotEnderecoEntrega:
            snapshotEnderecoEntrega ?? this.snapshotEnderecoEntrega,
        snapshotCliente: snapshotCliente ?? this.snapshotCliente,
        snapshotPoliticaDesconto:
            snapshotPoliticaDesconto ?? this.snapshotPoliticaDesconto,
        percentualDesconto: percentualDesconto ?? this.percentualDesconto,
        valorDesconto: valorDesconto ?? this.valorDesconto,
        valorFrete: valorFrete ?? this.valorFrete,
        valorSubtotal: valorSubtotal ?? this.valorSubtotal,
        valorTotal: valorTotal ?? this.valorTotal,
        motivoDesconto: motivoDesconto ?? this.motivoDesconto,
        observacoesInternas: observacoesInternas ?? this.observacoesInternas,
        observacoesCliente: observacoesCliente ?? this.observacoesCliente,
        chaveAssinaturaCliente:
            chaveAssinaturaCliente ?? this.chaveAssinaturaCliente,
        urlAssinaturaCliente: urlAssinaturaCliente ?? this.urlAssinaturaCliente,
        assinadaEm: assinadaEm ?? this.assinadaEm,
        chavePdf: chavePdf ?? this.chavePdf,
        urlPdf: urlPdf ?? this.urlPdf,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        cliente: cliente ?? this.cliente,
        criadoPor: criadoPor ?? this.criadoPor,
        atualizadoPor: atualizadoPor ?? this.atualizadoPor,
        responsavel: responsavel ?? this.responsavel,
        aprovadoPorDesconto: aprovadoPorDesconto ?? this.aprovadoPorDesconto,
        itens: itens ?? this.itens,
        historicoStatus: historicoStatus ?? this.historicoStatus,
        observacoes: observacoes ?? this.observacoes,
        imagens: imagens ?? this.imagens,
        fatura: fatura ?? this.fatura,
        intencoesUpload: intencoesUpload ?? this.intencoesUpload,
      );
}
