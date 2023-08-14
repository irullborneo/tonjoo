class ListSchema {
  final int limit;
  final int offset;
  final String? query;

  const ListSchema({
    required this.limit,
    required this.offset,
    this.query
  });
}