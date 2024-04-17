// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModel _$ClienteModelFromJson(Map<String, dynamic> json) => ClienteModel(
      id: json['id'] as String?,
      tipoCliente: json['tipo_cliente'] as int?,
      retemIss: json['retem_iss'] as bool?,
      nome: json['nome'] as String?,
      sobreNome: json['sobre_nome'] as String?,
      razaoSocial: json['razao_social'] as String?,
      cpf: json['cpf'] as String?,
      cnpj: json['cnpj'] as String?,
      dataNascimento: json['data_nascimento'] as String?,
      porQuemProcurar: json['por_quem_procurar'] as String?,
      telefoneContatoUm: json['telefone_contato_um'] as String?,
      telefoneContatoUmWhatsapp: json['telefone_contato_um_Whatsapp'] as bool?,
      telefoneContatoDois: json['telefone_contato_dois'] as String?,
      telefoneContatoDoisWhatsapp:
          json['telefone_contato_dois_Whatsapp'] as bool?,
      email: json['email'] as String?,
      userId: json['user_id'] as String?,
      mediaDaAvaliacao: _$JsonConverterFromJson<String, double>(
          json['media_da_avaliacao'], const StringToDoubleConverter().fromJson),
      endereco: json['endereco'] == null
          ? null
          : EnderecoModel.fromJson(json['endereco'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClienteModelToJson(ClienteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tipo_cliente': instance.tipoCliente,
      'retem_iss': instance.retemIss,
      'nome': instance.nome,
      'sobre_nome': instance.sobreNome,
      'razao_social': instance.razaoSocial,
      'cpf': instance.cpf,
      'cnpj': instance.cnpj,
      'data_nascimento': instance.dataNascimento,
      'por_quem_procurar': instance.porQuemProcurar,
      'telefone_contato_um': instance.telefoneContatoUm,
      'telefone_contato_um_Whatsapp': instance.telefoneContatoUmWhatsapp,
      'telefone_contato_dois': instance.telefoneContatoDois,
      'telefone_contato_dois_Whatsapp': instance.telefoneContatoDoisWhatsapp,
      'email': instance.email,
      'user_id': instance.userId,
      'media_da_avaliacao': _$JsonConverterToJson<String, double>(
          instance.mediaDaAvaliacao, const StringToDoubleConverter().toJson),
      'endereco': instance.endereco,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
