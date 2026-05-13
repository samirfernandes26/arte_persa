import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:arte_persa/src/core/ui/widgets/lazy_list_view/lazy_list_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ocupacao_select_vm.g.dart';

@riverpod
class OcupacaoSelectVm extends _$OcupacaoSelectVm {
  @override
  OcupacaoSelectState build() => OcupacaoSelectState.initial();

  Future<void> loadData(
    DataFeedController<CodigoBrasileiroOcupacao> controller, {
    String? search,
  }) async {
    final db = ref.read(databaseProvider);

    String? searchText = search ?? state.search;

    final query = db.codigoBrasileiroOcupacoesEntity.select();

    if (searchText != null && searchText.isNotEmpty) {
      final normalized = searchText.removeAcentos;

      query.where(
        (tbl) => Expression.or({
          tbl.descricao.like('%${searchText.toUpperCase()}%'),
          tbl.descricaoFiltro.like('%${normalized.toLowerCase()}%'),
          tbl.cbo.like('%$searchText%'),
        }),
      );
    }

    final offset = (state.page - 1) * state.pageSize;

    final cbos =
        await (query
              ..limit(state.pageSize, offset: offset)
              ..orderBy([(row) => OrderingTerm.asc(row.descricao)]))
            .get();

    if (kDebugMode) {
      print('Total de codigos');
      print(cbos.length);
    }

    controller.appendData(cbos);

    if (cbos.isNotEmpty && state.totalPages >= state.page) {
      state = state.copyWith(page: Nullable(state.page + 1));
    }
  }

  Future<void> calculateTotalPages(
    DataFeedController<CodigoBrasileiroOcupacao> controller, {
    String? search,
  }) async {
    final db = ref.read(databaseProvider);

    String? searchText = search ?? state.search;

    final query = db.codigoBrasileiroOcupacoesEntity.selectOnly();

    if (searchText != null && searchText.isNotEmpty) {
      query.where(
        Expression.or({
          db.codigoBrasileiroOcupacoesEntity.descricao.like(
            '%${searchText.toUpperCase()}%',
          ),
          db.codigoBrasileiroOcupacoesEntity.descricaoFiltro.like(
            '%${searchText.toLowerCase()}%',
          ),
          db.codigoBrasileiroOcupacoesEntity.cbo.like('$searchText%'),
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
    DataFeedController<CodigoBrasileiroOcupacao> controller,
    T? value,
  ) {
    final result = controller.data
        .where((element) => element.id == value)
        .firstOrNull;

    if (result != null) {
      return "${result.cbo} - ${result.descricao}";
    }
    return null;
  }

  void setSelected<T>(
    DataFeedController<CodigoBrasileiroOcupacao> controller,
    T? value,
  ) {
    state = state.copyWith(
      selected: Nullable(value),
      selectedLabel: Nullable(getSelectedLabel(controller, value)),
    );
  }

  Timer? _debounce;

  Future<void> onChangeTextFilter(
    DataFeedController<CodigoBrasileiroOcupacao> controller,
    String? search,
  ) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    state = state.copyWith(search: Nullable(search));

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await performSearch(controller, search);
    });
  }

  Future<void> performSearch(
    DataFeedController<CodigoBrasileiroOcupacao> controller,
    String? search,
  ) async {
    controller.flushData();

    await calculateTotalPages(controller, search: search);
  }
}
