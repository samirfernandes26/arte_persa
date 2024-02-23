// cadastro_servico_service.dart
import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cadastro_servico_model.g.dart';

@JsonSerializable()
class CadastroServicoModel {
  CadastroServicoModel({
    this.id,
    required this.nomeDoServico,
    this.categoriaSelecionada,
    this.metroQuadrado,
    this.metroLinear,
    this.valorFixo,
    this.valorManual,
    this.porcentagemServico,
    this.servicoSelecionando,
    this.porcentagem,
    this.userId,
    this.valor,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  
  @StringToIntConverter()
  int? porcentagem;

  @StringToDoubleConverter()
  double? valor;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'nome_do_servico')
  String nomeDoServico;

  @JsonKey(name: 'categoria_selecionada')
  String? categoriaSelecionada;

  @JsonKey(name: 'metro_quadrado')
  bool? metroQuadrado;

  @JsonKey(name: 'metro_linear')
  bool? metroLinear;

  @JsonKey(name: 'valor_fixo')
  bool? valorFixo;

  @JsonKey(name: 'valor_manual')
  bool? valorManual;

  @JsonKey(name: 'porcentagem_servico')
  bool? porcentagemServico;

  @JsonKey(name: 'servico_selecionado')
  String? servicoSelecionando;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$CadastroServicoModelToJson(this);

  factory CadastroServicoModel.fromJson(Map<String, dynamic> json) =>
      _$CadastroServicoModelFromJson(json);
}
