import 'package:json_annotation/json_annotation.dart';

import 'package:arte_persa/src/model/usuario_model.dart';

part 'cadastro_servico_state.g.dart';

enum CadastroServicoStateStatus {
  initial,
  loaded,
  success,
  error,
}

class CadastroServicoState {
  CadastroServicoState({
    required this.status,
    this.servicoForm,
    this.message,
    this.usuario,
  });

  CadastroServicoState.initial()
      : this(
          status: CadastroServicoStateStatus.initial,
        );

  CadastroServicoStateStatus status;
  CadastrosServicoForm? servicoForm;
  String? message;
  UsuarioModel? usuario;

  CadastroServicoState copyWith({
    CadastroServicoStateStatus? status,
    CadastrosServicoForm? servicoForm,
    String? message,
    UsuarioModel? usuario,
  }) => CadastroServicoState(
    status: status ?? this.status,
    servicoForm: servicoForm ?? this.servicoForm,
    message: message ?? this.message,
    usuario: usuario ?? this.usuario,
  );
}

@JsonSerializable()
class CadastrosServicoForm {

  CadastrosServicoForm({
    this.id,
    required this.userId,
    required this.nomeDoServico,
    required this.categoriaSelecionada,
    required this.metroQuadrado,
    required this.metroLinear,
    required this.valorFixo,
    required this.valorManual,
    required this.porcentagemServico,
    this.servicoSelecionando,
    this.porcentagem,
    this.valor,
    this.createdAt,
    this.updatedAt,
  });
  
  String? id;
  String userId;
  String nomeDoServico;
  String categoriaSelecionada;
  bool metroQuadrado;
  bool metroLinear;
  bool valorFixo;
  bool valorManual;
  bool porcentagemServico;
  String? servicoSelecionando;
  int? porcentagem;
  double? valor;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$CadastrosServicoFormToJson(this);

  factory CadastrosServicoForm.fromJson(Map<String, dynamic> json) =>
      _$CadastrosServicoFormFromJson(json);
}
