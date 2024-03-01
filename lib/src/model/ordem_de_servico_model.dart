import 'package:json_annotation/json_annotation.dart';

import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:arte_persa/src/model/image_model.dart';
import 'package:arte_persa/src/model/item_model.dart';
import 'package:arte_persa/src/model/faturamento_model.dart';

part 'ordem_de_servico_model.g.dart';

@JsonSerializable()
class OrdemDeServicoModel {
  
  OrdemDeServicoModel({
    this.id,
    this.clienteId,
    this.numeroPedido,
    required this.itens,
    required this.fatura,
    this.pathAssinaturaCliente,
    this.pathFotoAltorizacaoCliente,
    this.createdAt,
    this.updatedAt,
  });

  String? id;

  @JsonKey(name: 'cliente_id')
  String? clienteId;

  @StringToIntConverter()
  @JsonKey(name: 'numero_pedido')
  int? numeroPedido;

  List<ItemModel> itens;

  List<FaturamentoModel> fatura;

  @JsonKey(name: 'path_assinatura_cliente')
  ImageModel? pathAssinaturaCliente;

  @JsonKey(name: 'path_foto_altorizacao_cliente')
  ImageModel? pathFotoAltorizacaoCliente;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  OrdemDeServicoModel copyWith({
    String? id,
    String? clienteId,
    int? numeroPedido,
    List<ItemModel>? itens,
    List<FaturamentoModel>? fatura,
    ImageModel? pathAssinaturaCliente,
    ImageModel? pathFotoAltorizacaoCliente,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrdemDeServicoModel(
      id: id ?? this.id,
      clienteId: clienteId ?? this.clienteId,
      numeroPedido: numeroPedido ?? this.numeroPedido,
      itens: itens ?? this.itens,
      fatura: fatura ?? this.fatura,
      pathAssinaturaCliente: pathAssinaturaCliente ?? this.pathAssinaturaCliente,
      pathFotoAltorizacaoCliente: pathFotoAltorizacaoCliente ?? this.pathFotoAltorizacaoCliente,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => _$OrdemDeServicoModelToJson(this);
  factory OrdemDeServicoModel.fromJson(Map<String, dynamic> json) =>
      _$OrdemDeServicoModelFromJson(json);

  
}
