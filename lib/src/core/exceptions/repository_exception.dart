class RepositoryException<T> implements Exception {
  String message;
  T? type;

  RepositoryException({
    required this.message,
    this.type,
  });
}
