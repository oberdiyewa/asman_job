import 'dart:convert';

import 'package:asman_work/data/clients/remote/interceptor.dart';
import 'package:asman_work/data/clients/remote/interceptors/app_interceptors.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient({
    String? baseUrl,
    ResponseType? type,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ?? 'your base url',
            connectTimeout: const Duration(milliseconds: 10000),
            receiveTimeout: const Duration(milliseconds: 10000),
            responseType: type ?? ResponseType.json,
          ),
        )..interceptors.addAll(
            [
              AppInterceptors(),
              LoggerInterceptor(),
              //RetryOnConnectionChangeInterceptor(),
            ],
          );

  late final Dio _dio;

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.get<dynamic>(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response<dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.post<dynamic>(
      endPoint,
      data: jsonEncode(data),
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response<dynamic>> patch({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.patch<dynamic>(
      endPoint,
      data: jsonEncode(data),
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  

  Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.delete<dynamic>(
      path,
      options: Options(headers: headers),
    );
    return response;
  }
}
