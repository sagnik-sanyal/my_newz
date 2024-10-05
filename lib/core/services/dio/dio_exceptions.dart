import 'package:dio/dio.dart' show DioException;

class BadNetworkException extends DioException implements Exception {
  BadNetworkException({required super.requestOptions});
}

class InternalServerException extends DioException implements Exception {
  InternalServerException({required super.requestOptions});
}

class ForbiddenException extends DioException implements Exception {
  ForbiddenException({required super.requestOptions});
}

class ApiException extends DioException implements Exception {
  ApiException({
    required this.errorMessage,
    required super.requestOptions,
    super.response,
    super.error,
    super.type,
  });

  final String errorMessage;
}

class InvalidJsonException extends DioException implements Exception {
  InvalidJsonException({required super.requestOptions});
}
