import 'package:dio/dio.dart';

class DioClient {
  DioClient({required String baseUrl, required String bearerToken})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 60 * 2),
          receiveTimeout: const Duration(seconds: 60 * 2),
          headers: {
            'Authorization': 'Bearer $bearerToken',
            'accept': 'application/json',
          },
        ),
      ) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  final Dio dio;
}
