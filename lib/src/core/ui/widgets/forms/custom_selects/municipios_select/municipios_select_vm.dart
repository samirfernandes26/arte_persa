import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fp/fp.dart';
import 'package:lazy_list_view/lazy_list_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'municipios_select_vm.g.dart';

typedef LocalidadeUf = ({Localidade localidade, UF uf});

@riverpod
class MunicipiosSelectVm extends _$MunicipiosSelectVm {
  @override
  MunicipiosSelectState build() => MunicipiosSelectState.initial();

  Future<void> loadData(
    DataFeedController<LocalidadeUf> controller, {
    String? search,
  }) async {
    final db = ref.read(databaseProvider);

    String? searchText = search ?? state.search;

    final query = db.ufEntity.select().join([
      innerJoin(
        db.localidadeEntity,
        db.localidadeEntity.ufId.equalsExp(db.ufEntity.id) &
            db.localidadeEntity.tipoLocalidadeId.equals(1),
      ),
    ]);

    if (searchText != null && searchText != '') {
      final normalized = searchText.removeAcentos;

      query.where(
        Expression.or({
          db.localidadeEntity.localidade.like('%${searchText.toUpperCase()}}%'),
          db.localidadeEntity.localidadeFiltro.like('%$normalized%'),
          db.localidadeEntity.ibge.like('$searchText%'),
        }),
      );
    }

    final offset = (state.page - 1) * state.pageSize;

    final municipios =
        await (query
              ..limit(state.pageSize, offset: offset)
              ..orderBy([OrderingTerm.asc(db.localidadeEntity.localidade)]))
            .map<LocalidadeUf>(
              (row) => (
                localidade: row.readTable(db.localidadeEntity),
                uf: row.readTable(db.ufEntity),
              ),
            )
            .get();

    if (kDebugMode) {
      print('Total de municipios');
      print(municipios.length);
    }

    controller.appendData(municipios);

    if (municipios.isNotEmpty && state.totalPages >= state.page) {
      state = state.copyWith(page: Nullable(state.page + 1));
    }
  }

  Future<void> calculateTotalPages(
    DataFeedController<LocalidadeUf> controller, {
    String? search,
  }) async {
    final db = ref.read(databaseProvider);

    String? searchText = search ?? state.search;

    final query = db.ufEntity.selectOnly().join([
      innerJoin(
        db.localidadeEntity,
        db.localidadeEntity.ufId.equalsExp(db.ufEntity.id) &
            db.localidadeEntity.tipoLocalidadeId.equals(1),
      ),
    ]);

    if (searchText != null && searchText.isNotEmpty) {
      query.where(
        Expression.or({
          db.localidadeEntity.localidade.like('%${searchText.toUpperCase()}%'),
          db.localidadeEntity.localidadeFiltro.like(
            '%${searchText.toLowerCase()}%',
          ),
          db.localidadeEntity.ibge.like('$searchText%'),
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
    DataFeedController<LocalidadeUf> controller,
    T? value,
  ) {
    final result = controller.data
        .where((element) => element.localidade.ibge == value)
        .firstOrNull;

    if (result != null) {
      return "${result.localidade.localidade} - ${result.uf.uf}";
    }
    return null;
  }

  void setSelected<T>(DataFeedController<LocalidadeUf> controller, T? value) {
    state = state.copyWith(
      selected: Nullable(value),
      selectedLabel: Nullable(getSelectedLabel(controller, value)),
    );
  }

  Timer? _debounce;

  Future<void> onChangeTextFilter(
    DataFeedController<LocalidadeUf> controller,
    String? search,
  ) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    state = state.copyWith(search: Nullable(search));

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await performSearch(controller, search);
    });
  }

  Future<void> performSearch(
    DataFeedController<LocalidadeUf> controller,
    String? search,
  ) async {
    controller.flushData();

    await calculateTotalPages(controller, search: search);
  }
}
