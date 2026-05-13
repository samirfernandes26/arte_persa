import 'package:fp/fp.dart';

class TipoLogradouroSelectState<T> with NullableMixin {
  int page;
  int pageSize;
  int totalPages;
  T? selected;
  String? selectedLabel;
  String? search;

  TipoLogradouroSelectState({
    required this.page,
    required this.pageSize,
    required this.totalPages,
    this.selected,
    this.selectedLabel,
    this.search,
  });

  TipoLogradouroSelectState.initial()
      : page = 1,
        pageSize = 25,
        totalPages = 0,
        search = null,
        selected = null,
        selectedLabel = null;

  TipoLogradouroSelectState copyWith({
    Nullable<int>? page,
    Nullable<int>? pageSize,
    Nullable<int>? totalPages,
    Nullable<T>? selected,
    Nullable<T>? selectedLabel,
    Nullable<String>? search,
  }) =>
      TipoLogradouroSelectState(
        page: handleNullable(page, this.page),
        pageSize: handleNullable(pageSize, this.pageSize),
        totalPages: handleNullable(totalPages, this.totalPages),
        selected: handleNullable(selected, this.selected),
        selectedLabel: handleNullable(selectedLabel, this.selectedLabel),
        search: handleNullable(search, this.search),
      );
}
