class PaginationSortArgs {
  String? property;
  PaginationSortOrderType? direction;
}

enum PaginationSortOrderType {
  ASC,
  DESC,
}

class PaginationPage<T> {
  List<T>? content;
  bool? last;
  int? totalElements;
  int? totalPages;
  int? size;
  int? number;
  bool? first;
  List<PaginationSortArgs>? sort;
}

class PaginationArgs {
  int? pageNumber;
  int? pageSize;
  List<PaginationSortArgs>? sorts;
}
