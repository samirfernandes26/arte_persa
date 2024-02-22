// cadastro_servico_service.dart 
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
    required this.userId,
    this.valor,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String userId;
  String nomeDoServico;
  String? categoriaSelecionada;
  bool? metroQuadrado;
  bool? metroLinear;
  bool? valorFixo;
  bool? valorManual;
  bool? porcentagemServico;
  String? servicoSelecionando;
  int? porcentagem;
  int? valor;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  

  Map<String, dynamic> toJson() => _$CadastroServicoModelToJson(this);

  factory CadastroServicoModel.fromJson(Map<String, dynamic> json) =>
      _$CadastroServicoModelFromJson(json);
}
