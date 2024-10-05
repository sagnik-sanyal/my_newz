import 'package:dio/dio.dart';

class ApiException extends DioException implements Exception {
  ApiException({
    required super.requestOptions,
    this.errorMessage = 'An error occurred while processing your request',
    super.response,
    super.error,
    super.type,
  });

  final String errorMessage;
}

class PoorNetworkException extends ApiException implements Exception {
  PoorNetworkException(RequestOptions requestOptions)
      : super(
          requestOptions: requestOptions,
          errorMessage: 'Poor network connection',
        );
}

class InternalServerException extends ApiException implements Exception {
  InternalServerException(RequestOptions requestOptions)
      : super(
          requestOptions: requestOptions,
          errorMessage: 'Internal Server Error',
        );
}

class ForbiddenException extends ApiException implements Exception {
  ForbiddenException(
    RequestOptions requestOptions,
  ) : super(
          requestOptions: requestOptions,
          errorMessage: 'You are not authorized to access this resource',
        );
}

class InvalidJsonException extends ApiException implements Exception {
  InvalidJsonException(
    RequestOptions requestOptions,
  ) : super(
          requestOptions: requestOptions,
          errorMessage: 'Invalid response from server',
        );
}
