class ServerException implements Exception {
  final String? error;
  ServerException({this.error});
}

class InternetException implements Exception {
  final String? error;
  InternetException({this.error});
}
