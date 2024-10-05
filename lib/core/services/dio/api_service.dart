import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../app/typedefs/typedefs.dart';
import '../../states/result.dart';

final class ApiService {
  /// Create a new instance of [ApiService]
  ApiService({
    required String apiKey,
    String baseUrl = 'https://newsapi.org/v2/',
    Dio? customClient,
  }) : dio = customClient ?? Dio() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
    dio.options.headers = <String, String>{'Authorization': 'Bearer $apiKey'};
  }

  final Dio dio;

  /// Perform a GET request
  Future<Result<JSON>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final Response<JSON> response =
          await dio.get<JSON>(endpoint, queryParameters: queryParams);
      return Result.guard(() => response.data!);
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // Error handling
  void _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        log('Connection Timeout Exception');
      case DioExceptionType.sendTimeout:
        log('Send Timeout Exception');
      case DioExceptionType.receiveTimeout:
        log('Receive Timeout Exception');

      case DioExceptionType.cancel:
        log('Request was cancelled');
      default:
        log('Unknown Error: ${error.message}');
    }
  }
}
