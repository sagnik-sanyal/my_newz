import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../../../app/typedefs/typedefs.dart';
import '../../result.dart';
import '../objectbox/cache_store.dart';
import 'error_interceptor.dart';

final class ApiService {
  /// Create a new instance of [ApiService]
  ApiService({
    required String apiKey,
    String baseUrl = 'https://newsapi.org/v2/',
  }) : dio = Dio() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
    dio.options.headers = <String, String>{'X-Api-Key': apiKey};
    dio.transformer = BackgroundTransformer();
    dio.interceptors.addAll(<Interceptor>[
      LogInterceptor(responseBody: true, requestBody: true),
      const ErrorInterceptor(),
      DioCacheInterceptor(options: ObjectBoxCacheStore().addOptions()),
    ]);
  }

  final Dio dio;

  /// Perform a GET request
  Future<Result<JSON>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    return Result.guardAsync(() async {
      final Response<JSON> response =
          await dio.get<JSON>(endpoint, queryParameters: queryParams);
      log('GET $endpoint: ${response.realUri}');
      return response.data!;
    });
  }
}
