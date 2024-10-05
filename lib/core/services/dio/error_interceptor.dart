import 'package:dio/dio.dart';

import '../../exceptions/dio_exceptions.dart';

class ErrorInterceptor extends Interceptor {
  const ErrorInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final int? statusCode = err.response?.statusCode;
    if (err.type == DioExceptionType.unknown) {
      return handler.reject(
        ApiException(
          requestOptions: err.requestOptions,
          response: err.response,
          error: err.error,
          type: err.type,
        ),
      );
    } else if (err.type == DioExceptionType.connectionError) {
      return handler.reject(PoorNetworkException(err.requestOptions));
    }
    return switch (statusCode) {
      401 => handler.reject(ForbiddenException(err.requestOptions)),
      500 => handler.reject(InternalServerException(err.requestOptions)),
      _ => handler.next(err),
    };
  }
}
