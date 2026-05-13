import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

FutureOr<Iterable<String>> searchFilterLogradouro(
  Database database, {
  required TextEditingValue searchText,
  required TypeSearch type,
}) async {
  final query = database.select(database.enderecoEntity);

  switch (type) {
    case TypeSearch.cep:
      query.where((tbl) => tbl.cep.like('%${searchText.text}%'));
    case TypeSearch.logradouro:
      query.where(
        (tbl) => Expression.or([
          tbl.logradouro.like('%${searchText.text.toUpperCase()}%'),
          tbl.logradouroFiltro.like('%${searchText.text.toLowerCase()}%'),
        ]),
      );
    case TypeSearch.bairro:
      query.where(
        (tbl) => Expression.or([
          tbl.bairro.like('%${searchText.text.toUpperCase()}%'),
        ]),
      );
  }

  final result = await query
      .map(
        (row) => {
          'description': switch (type) {
            TypeSearch.cep => row.cep,
            TypeSearch.logradouro => row.logradouro,
            TypeSearch.bairro => row.bairro,
          },
        },
      )
      .get();

  return result
      .groupListsBy((element) => element['description'].toString())
      .keys;
}
