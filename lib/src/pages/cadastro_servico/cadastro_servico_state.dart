import 'package:json_annotation/json_annotation.dart';

import 'package:arte_persa/src/model/cadastro_model.dart';

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
    this.form,
    this.message,
    this.usuario,
  });

  CadastroServicoState.initial()
      : this(
          status: CadastroServicoStateStatus.initial,
        );

  CadastroServicoStateStatus status;
  CadastrosServicoForm? form;
  String? message;
  CadastroModel? usuario;

  CadastroServicoState copyWith({
    CadastroServicoStateStatus? status,
    CadastrosServicoForm? form,
    String? message,
    CadastroModel? usuario,
  }) => CadastroServicoState(
    status: status ?? this.status,
    form: form ?? this.form,
    message: message ?? this.message,
    usuario: usuario ?? this.usuario,
  );
}

@JsonSerializable()
class CadastrosServicoForm {

  CadastrosServicoForm({
    this.id,
    this.nomeDoServico,
    this.categoriaSelecionada,
    this.metroQuadrado,
    this.metroLinear,
    this.valorFixo,
    this.valorManual,
    this.porcentagemServico,
    this.servicoSelecionando,
    this.porcentagem,
    this.valor,
    this.createdAt,
    this.updatedAt,
  });
  
  String? id;
  String? user;
  String? nomeDoServico;
  String? categoriaSelecionada;
  bool? metroQuadrado;
  bool? metroLinear;
  bool? valorFixo;
  bool? valorManual;
  bool? porcentagemServico;
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
