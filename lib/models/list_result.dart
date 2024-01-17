class ListResultModel<T> {
  final int currentPage;
  final bool hasMore;
  final List<T> items;

  ListResultModel._({
    required this.currentPage,
    required this.hasMore,
    required this.items,
  });

  factory ListResultModel.fromJSON(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) jsonParser,
  ) {
    int currentPage = json['current_page'];
    bool hasMore = json['has_more'];

    return ListResultModel._(
      currentPage: currentPage,
      hasMore: hasMore,
      items: (json['list'] as List).map((item) => jsonParser(item)).toList(),
    );
  }
}
