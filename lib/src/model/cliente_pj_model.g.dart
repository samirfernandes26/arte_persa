// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_pj_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientePjModel _$ClientePjModelFromJson(Map<String, dynamic> json) =>
    ClientePjModel(
      retemIss: json['retem_iss'] as bool,
      razaoSocial: json['razao_social'] as String,
      cnpj: json['cnpj'] as String,
      porQuemProcurar: json['por_quem_procurar'] as String,
      telefoneContatoUm: json['telefone_contato_um'] as String,
      telefoneContatoUmWhatsapp: json['telefone_contato_um_Whatsapp'] as bool,
      telefoneContatoDoisWhatsapp:
          json['telefone_contato_dois_Whatsapp'] as bool,
      email: json['email'] as String,
      endereco: json['endereco'] == null
          ? null
          : EnderecoModel.fromJson(json['endereco'] as Map<String, dynamic>),
      userId: json['user_id'] as String?,
      id: json['id'] as String?,
      telefoneContatoDois: json['telefone_contato_dois'] as String?,
      mediaDaAvaliacao: _$JsonConverterFromJson<String, double>(
          json['media_da_avaliacao'], const StringToDoubleConverter().fromJson),
    );

Map<String, dynamic> _$ClientePjModelToJson(ClientePjModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'retem_iss': instance.retemIss,
      'razao_social': instance.razaoSocial,
      'cnpj': instance.cnpj,
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
