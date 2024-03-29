import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'servico_model.g.dart';

@JsonSerializable()
class ServicoModel {
  ServicoModel({
    this.id,
    required this.nomeDoServico,
    required this.categoriaSelecionada,
    required this.metroQuadrado,
    required this.metroLinear,
    required this.valorFixo,
    required this.valorManual,
    required this.userId,
    this.valor,
    this.valorCalculo,
    this.createdAt,
    this.updatedAt,
  });

  String? id;

  @StringToDoubleConverter()
  double? valor;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'valor_calculo')
  @StringToDoubleConverter()
  double? valorCalculo;

  @JsonKey(name: 'nome_do_servico')
  String nomeDoServico;

  @JsonKey(name: 'categoria_selecionada')
  String categoriaSelecionada;

  @JsonKey(name: 'metro_quadrado')
  bool metroQuadrado;

  @JsonKey(name: 'metro_linear')
  bool metroLinear;

  @JsonKey(name: 'valor_fixo')
  bool valorFixo;

  @JsonKey(name: 'valor_manual')
  bool valorManual;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  ServicoModel copyWith({
    String? id,

    double? valor,
    String? userId,
    double? valorCalculo,
    String? nomeDoServico,
    String? categoriaSelecionada,
    bool? metroQuadrado,
    bool? metroLinear,
    bool? valorFixo,
    bool? valorManual,

    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ServicoModel(
      id: id ?? this.id,
      valor: valor ?? this.valor,
      userId: userId ?? this.userId,
      valorCalculo: valorCalculo ?? this.valorCalculo,
      nomeDoServico: nomeDoServico ?? this.nomeDoServico,
      categoriaSelecionada: categoriaSelecionada ?? this.categoriaSelecionada,
      metroQuadrado: metroQuadrado ?? this.metroQuadrado,
      metroLinear: metroLinear ?? this.metroLinear,
      valorFixo: valorFixo ?? this.valorFixo,
      valorManual: valorManual ?? this.valorManual,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => _$ServicoModelToJson(this);

  factory ServicoModel.fromJson(Map<String, dynamic> json) =>
      _$ServicoModelFromJson(json);
}
