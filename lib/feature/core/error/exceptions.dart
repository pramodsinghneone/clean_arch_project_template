class ServerException implements Exception {
  final String? error;
  ServerException(this.error);
}
