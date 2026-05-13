import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fp/fp.dart';
import 'package:lazy_list_view/lazy_list_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paises_select_vm.g.dart';

typedef LocalidadeUf = ({Localidade localidade, UF uf});

@riverpod
class PaisesSelectVm extends _$PaisesSelectVm {
  @override
  PaisesSelectState build() => PaisesSelectState.initial();

  Future<void> loadData(
    DataFeedController<Pais> controller, {
    String? search,
  }) async {
    final db = ref.read(databaseProvider);

    String? searchText = search ?? state.search;

    final query = db.paisEntity.select();

    if (searchText != null && searchText != '') {
      final normalized = searchText.removeAcentos;

      query.where(
        (tbl) => Expression.and({
          Expression.or({
            tbl.nome.like('%${searchText.toUpperCase()}}%'),
            tbl.nomeFiltro.like('%${normalized.toLowerCase()}%'),
            tbl.sigla3.like('$searchText%'),
          }),
          tbl.nome.isNotValue('BRASIL'),
        }),
      );
    }

    final offset = (state.page - 1) * state.pageSize;

    final paises =
        await (query
              ..limit(state.pageSize, offset: offset)
              ..orderBy([(row) => OrderingTerm.asc(row.nome)]))
            .get();

    if (kDebugMode) {
      print('Total de paises');
      print(paises.length);
    }

    controller.appendData(paises);

    if (paises.isNotEmpty && state.totalPages >= state.page) {
      state = state.copyWith(page: Nullable(state.page + 1));
    }
  }

  Future<void> calculateTotalPages(
    DataFeedController<Pais> controller, {
    String? search,
  }) async {
    final db = ref.read(databaseProvider);

    String? searchText = search ?? state.search;

    final query = db.paisEntity.selectOnly();

    if (searchText != null && searchText != '') {
      query.where(
        Expression.and({
          Expression.or({
            db.paisEntity.nome.like('%${searchText.toUpperCase()}}%'),
            db.paisEntity.nomeFiltro.like('%${searchText.toLowerCase()}%'),
            db.paisEntity.sigla3.like('$searchText%'),
          }),
          db.paisEntity.nome.isNotValue('BRASIL'),
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

  String? getSelectedLabel<T>(DataFeedController<Pais> controller, T? value) {
    final result = controller.data
        .where((element) => element.id == value)
        .firstOrNull;

    if (result != null) {
      return result.nome;
    }
    return null;
  }

  void setSelected<T>(DataFeedController<Pais> controller, T? value) {
    state = state.copyWith(
      selected: Nullable(value),
      selectedLabel: Nullable(getSelectedLabel(controller, value)),
    );
  }

  Timer? _debounce;

  Future<void> onChangeTextFilter(
    DataFeedController<Pais> controller,
    String? search,
  ) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    state = state.copyWith(search: Nullable(search));

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await performSearch(controller, search);
    });
  }

  Future<void> performSearch(
    DataFeedController<Pais> controller,
    String? search,
  ) async {
    controller.flushData();

    await calculateTotalPages(controller, search: search);
  }
}
