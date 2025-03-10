import 'package:logger/logger.dart';

class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class ServerException extends AppException {
  final int statusCode;
  ServerException(super.message, this.statusCode);
}

class CacheException extends AppException {
  CacheException(super.message);
  @override
  String toString() {
    Logger().e(message);
    return message;
}
}
