class ServerException implements Exception {
  final String errorMessage;
  final String errorCode;

  const ServerException({
    required this.errorMessage,
    required this.errorCode,
  });
}
