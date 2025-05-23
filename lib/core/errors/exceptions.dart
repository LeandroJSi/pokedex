class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'ServerException']);
  @override
  String toString() => 'ServerException: $message';
}

class RepositoryException implements Exception {
  final String message;
  RepositoryException([this.message = 'RepositoryException']);
  @override
  String toString() => 'RepositoryException: $message';
}