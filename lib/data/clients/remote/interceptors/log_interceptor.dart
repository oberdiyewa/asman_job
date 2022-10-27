import 'package:asmanshop/utils/settings/extentions.dart';
import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    '!!! ${options.method} request => $requestPath'.log();
    '!!! Error: ${err.error}, Message: ${err.message}'.log(); // Error log
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    '-> -> -> ${options.method} request => $requestPath'.log(); // Info log
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    '<- <- <- StatusCode: ${response.statusCode}, Data: ${response.data}'.log();
    return super.onResponse(response, handler);
  }
}
