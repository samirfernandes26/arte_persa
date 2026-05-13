import 'package:arte_persa/src/core/fp/fp.dart';

class OcupacaoSelectState<T> with NullableMixin {
  int page;
  int pageSize;
  int totalPages;
  T? selected;
  String? selectedLabel;
  String? search;

  OcupacaoSelectState({
    required this.page,
    required this.pageSize,
    required this.totalPages,
    this.selected,
    this.selectedLabel,
    this.search,
  });

  OcupacaoSelectState.initial()
      : page = 1,
        pageSize = 25,
        totalPages = 0,
        search = null,
        selected = null,
        selectedLabel = null;

  OcupacaoSelectState copyWith({
    Nullable<int>? page,
    Nullable<int>? pageSize,
    Nullable<int>? totalPages,
    Nullable<T>? selected,
    Nullable<T>? selectedLabel,
    Nullable<String>? search,
  }) =>
      OcupacaoSelectState(
        page: handleNullable(page, this.page),
        pageSize: handleNullable(pageSize, this.pageSize),
        totalPages: handleNullable(totalPages, this.totalPages),
        selected: handleNullable(selected, this.selected),
        selectedLabel: handleNullable(selectedLabel, this.selectedLabel),
        search: handleNullable(search, this.search),
      );
}
