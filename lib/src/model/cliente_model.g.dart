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
    };
