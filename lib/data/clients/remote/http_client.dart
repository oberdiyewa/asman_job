import 'package:asman_work/data/clients/remote/interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient({
    String? baseUrl,
    ResponseType? type,
    String? token,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ?? 'your base url',
            connectTimeout: 5000,
            receiveTimeout: 5000,
            responseType: type ?? ResponseType.json,
          ),
        )..interceptors.addAll(
            [
              AuthorizationInterceptor(token),
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
    try {
      final response = await _dio
          .get<dynamic>(
            path,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          )
          .catchError((dynamic err) {});
      return response;
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.post<dynamic>(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }
}
