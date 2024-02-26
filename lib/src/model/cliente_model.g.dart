// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModel _$ClienteModelFromJson(Map<String, dynamic> json) => ClienteModel(
      id: json['id'] as String?,
      tipoCliente: json['tipo_cliente'] as String,
      retemIss: json['retem_iss'] as bool,
      nomeCompleto: json['nome_completo'] as String,
      razaoSocial: json['razao_social'] as String?,
      cpf: json['cpf'] as String?,
      cnpj: json['cnpj'] as String?,
      dataNascimento: json['data_nascimento'] as String?,
      porQuemProcurar: json['por_quem_procurar'] as String?,
      telefoneContatoUm: json['telefone_contato_um'] as String?,
      telefoneContatoDois: json['telefone_contato_dois'] as String?,
      email: json['email'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$ClienteModelToJson(ClienteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tipo_cliente': instance.tipoCliente,
      'retem_iss': instance.retemIss,
      'nome_completo': instance.nomeCompleto,
      'razao_social': instance.razaoSocial,
      'cpf': instance.cpf,
      'cnpj': instance.cnpj,
      'data_nascimento': instance.dataNascimento,
      'por_quem_procurar': instance.porQuemProcurar,
      'telefone_contato_um': instance.telefoneContatoUm,
      'telefone_contato_dois': instance.telefoneContatoDois,
      'email': instance.email,
      'user_id': instance.userId,
    };
