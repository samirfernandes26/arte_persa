import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:arte_persa/src/core/ui/widgets/lazy_list_view/lazy_list_view.dart';

part 'tipo_logradouro_select_vm.g.dart';

@riverpod
class TipoLogradouroSelectVm extends _$TipoLogradouroSelectVm {
  @override
  TipoLogradouroSelectState build() => TipoLogradouroSelectState.initial();

  Future<void> loadData(
    DataFeedController<TipoLogradouro> controller, {
    String? search,
  }) async {
    final db = ref.read(databaseProvider);

    String? searchText = search ?? state.search;

    final query = db.tipoLogradouroEntity.select();

    if (searchText != null && searchText.isNotEmpty) {
      final normalized = searchText.removeAcentos;

      query.where(
        (tbl) => Expression.or({
          tbl.nome.like('%${searchText.toUpperCase()}%'),
          tbl.nomeFiltro.like('%${normalized.toLowerCase()}%'),
        }),
      );
    }

    final prioridade = [8, 11, 24, 31, 65, 90, 81, 100, 104];
    final offset = (state.page - 1) * state.pageSize;

    final tipoLogradouro =
        await (query
              ..limit(state.pageSize, offset: offset)
              ..orderBy([
                (row) => OrderingTerm.desc(row.id.isIn(prioridade)),
                (row) => OrderingTerm.asc(row.nome),
              ]))
            .get();

    if (kDebugMode) {
      print('Total de tipoLogradouro');
      print(tipoLogradouro.length);
    }

    controller.appendData(tipoLogradouro);

    if (tipoLogradouro.isNotEmpty && state.totalPages >= state.page) {
      state = state.copyWith(page: Nullable(state.page + 1));
    }
  }

  Future<void> calculateTotalPages(
    DataFeedController<TipoLogradouro> controller, {
    String? search,
  }) async {
    final db = ref.read(databaseProvider);

    String? searchText = search ?? state.search;

    final query = db.tipoLogradouroEntity.selectOnly();

    if (searchText != null && searchText.isNotEmpty) {
      query.where(
        Expression.or({
          db.tipoLogradouroEntity.nome.like('%${searchText.toUpperCase()}%'),
          db.tipoLogradouroEntity.nomeFiltro.like(
            '%${searchText.toLowerCase()}%',
          ),
        }),
      );
    }

    final totalRows = query..addColumns([countAll()]);

    final result = await totalRows.getSingle();

    final totalCount = result.read<int>(countAll()) ?? 0;
    final totalPages = (totalCount / state.pageSize).ceil();

    state = state.copyWith(
      totalPages: Nullable(totalPages),
      page: const Nullable(1),
    );

    await loadData(controller, search: searchText);
  }

  String? getSelectedLabel<T>(
    DataFeedController<TipoLogradouro> controller,
    T? value,
  ) {
    final result = controller.data
        .where((element) => element.id == value)
        .firstOrNull;

    if (result != null) {
      return result.nome;
    }
    return null;
  }

  void setSelected<T>(DataFeedController<TipoLogradouro> controller, T? value) {
    state = state.copyWith(
      selected: Nullable(value),
      selectedLabel: Nullable(getSelectedLabel(controller, value)),
    );
  }

  Timer? _debounce;

  Future<void> onChangeTextFilter(
    DataFeedController<TipoLogradouro> controller,
    String? search,
  ) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    state = state.copyWith(search: Nullable(search));

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await performSearch(controller, search);
    });
  }

  Future<void> performSearch(
    DataFeedController<TipoLogradouro> controller,
    String? search,
  ) async {
    controller.flushData();

    await calculateTotalPages(controller, search: search);
  }
}
