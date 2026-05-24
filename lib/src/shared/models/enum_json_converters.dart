import 'package:json_annotation/json_annotation.dart';

import 'canal_entrada_ordem_servico_model.dart';
import 'categoria_item_model.dart';
import 'enum_model_base.dart';
import 'material_item_model.dart';
import 'metodo_pagamento_model.dart';
import 'perfil_usuario_model.dart';
import 'status_fatura_model.dart';
import 'status_ordem_servico_model.dart';
import 'tipo_alvo_observacao_model.dart';
import 'tipo_contato_cliente_model.dart';
import 'tipo_endereco_cliente_model.dart';
import 'tipo_pessoa_cliente_model.dart';
import 'unidade_cobranca_servico_model.dart';
import 'visibilidade_observacao_model.dart';

class PerfilUsuarioModelConverter
    implements JsonConverter<PerfilUsuarioModel, Object?> {
  const PerfilUsuarioModelConverter();

  @override
  PerfilUsuarioModel fromJson(Object? json) => PerfilUsuarioModel.fromValor(
      enumValorFromJson(json, 'PerfilUsuarioModel'));

  @override
  Object toJson(PerfilUsuarioModel object) => object.toJson();
}

class TipoPessoaClienteModelConverter
    implements JsonConverter<TipoPessoaClienteModel, Object?> {
  const TipoPessoaClienteModelConverter();

  @override
  TipoPessoaClienteModel fromJson(Object? json) =>
      TipoPessoaClienteModel.fromValor(
        enumValorFromJson(json, 'TipoPessoaClienteModel'),
      );

  @override
  Object toJson(TipoPessoaClienteModel object) => object.toJson();
}

class TipoContatoClienteModelConverter
    implements JsonConverter<TipoContatoClienteModel, Object?> {
  const TipoContatoClienteModelConverter();

  @override
  TipoContatoClienteModel fromJson(Object? json) =>
      TipoContatoClienteModel.fromValor(
        enumValorFromJson(json, 'TipoContatoClienteModel'),
      );

  @override
  Object toJson(TipoContatoClienteModel object) => object.toJson();
}

class TipoEnderecoClienteModelConverter
    implements JsonConverter<TipoEnderecoClienteModel, Object?> {
  const TipoEnderecoClienteModelConverter();

  @override
  TipoEnderecoClienteModel fromJson(Object? json) =>
      TipoEnderecoClienteModel.fromValor(
        enumValorFromJson(json, 'TipoEnderecoClienteModel'),
      );

  @override
  Object toJson(TipoEnderecoClienteModel object) => object.toJson();
}

class CanalEntradaOrdemServicoModelConverter
    implements JsonConverter<CanalEntradaOrdemServicoModel, Object?> {
  const CanalEntradaOrdemServicoModelConverter();

  @override
  CanalEntradaOrdemServicoModel fromJson(Object? json) =>
      CanalEntradaOrdemServicoModel.fromValor(
        enumValorFromJson(json, 'CanalEntradaOrdemServicoModel'),
      );

  @override
  Object toJson(CanalEntradaOrdemServicoModel object) => object.toJson();
}

class CategoriaItemModelConverter
    implements JsonConverter<CategoriaItemModel, Object?> {
  const CategoriaItemModelConverter();

  @override
  CategoriaItemModel fromJson(Object? json) => CategoriaItemModel.fromValor(
      enumValorFromJson(json, 'CategoriaItemModel'));

  @override
  Object toJson(CategoriaItemModel object) => object.toJson();
}

class MaterialItemModelNullableConverter
    implements JsonConverter<MaterialItemModel?, Object?> {
  const MaterialItemModelNullableConverter();

  @override
  MaterialItemModel? fromJson(Object? json) => json == null
      ? null
      : MaterialItemModel.fromValor(
          enumValorFromJson(json, 'MaterialItemModel'));

  @override
  Object? toJson(MaterialItemModel? object) => object?.toJson();
}

class UnidadeCobrancaServicoModelConverter
    implements JsonConverter<UnidadeCobrancaServicoModel, Object?> {
  const UnidadeCobrancaServicoModelConverter();

  @override
  UnidadeCobrancaServicoModel fromJson(Object? json) =>
      UnidadeCobrancaServicoModel.fromValor(
        enumValorFromJson(json, 'UnidadeCobrancaServicoModel'),
      );

  @override
  Object toJson(UnidadeCobrancaServicoModel object) => object.toJson();
}

class StatusOrdemServicoModelConverter
    implements JsonConverter<StatusOrdemServicoModel, Object?> {
  const StatusOrdemServicoModelConverter();

  @override
  StatusOrdemServicoModel fromJson(Object? json) =>
      StatusOrdemServicoModel.fromValor(
        enumValorFromJson(json, 'StatusOrdemServicoModel'),
      );

  @override
  Object toJson(StatusOrdemServicoModel object) => object.toJson();
}

class StatusOrdemServicoModelNullableConverter
    implements JsonConverter<StatusOrdemServicoModel?, Object?> {
  const StatusOrdemServicoModelNullableConverter();

  @override
  StatusOrdemServicoModel? fromJson(Object? json) => json == null
      ? null
      : StatusOrdemServicoModel.fromValor(
          enumValorFromJson(json, 'StatusOrdemServicoModel'),
        );

  @override
  Object? toJson(StatusOrdemServicoModel? object) => object?.toJson();
}

class TipoAlvoObservacaoModelConverter
    implements JsonConverter<TipoAlvoObservacaoModel, Object?> {
  const TipoAlvoObservacaoModelConverter();

  @override
  TipoAlvoObservacaoModel fromJson(Object? json) =>
      TipoAlvoObservacaoModel.fromValor(
        enumValorFromJson(json, 'TipoAlvoObservacaoModel'),
      );

  @override
  Object toJson(TipoAlvoObservacaoModel object) => object.toJson();
}

class VisibilidadeObservacaoModelConverter
    implements JsonConverter<VisibilidadeObservacaoModel, Object?> {
  const VisibilidadeObservacaoModelConverter();

  @override
  VisibilidadeObservacaoModel fromJson(Object? json) =>
      VisibilidadeObservacaoModel.fromValor(
        enumValorFromJson(json, 'VisibilidadeObservacaoModel'),
      );

  @override
  Object toJson(VisibilidadeObservacaoModel object) => object.toJson();
}

class StatusFaturaModelConverter
    implements JsonConverter<StatusFaturaModel, Object?> {
  const StatusFaturaModelConverter();

  @override
  StatusFaturaModel fromJson(Object? json) =>
      StatusFaturaModel.fromValor(enumValorFromJson(json, 'StatusFaturaModel'));

  @override
  Object toJson(StatusFaturaModel object) => object.toJson();
}

class MetodoPagamentoModelNullableConverter
    implements JsonConverter<MetodoPagamentoModel?, Object?> {
  const MetodoPagamentoModelNullableConverter();

  @override
  MetodoPagamentoModel? fromJson(Object? json) => json == null
      ? null
      : MetodoPagamentoModel.fromValor(
          enumValorFromJson(json, 'MetodoPagamentoModel'),
        );

  @override
  Object? toJson(MetodoPagamentoModel? object) => object?.toJson();
}
