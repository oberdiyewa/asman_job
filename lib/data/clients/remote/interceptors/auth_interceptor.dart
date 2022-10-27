// Request methods PUT, POST, PATCH, DELETE needs access token,
// which needs to be passed with "Authorization" header as Bearer token.
import 'package:dio/dio.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor(String? token) : _token = token ?? '';
  final String _token;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_needAuthorizationHeader(options)) {
      // adds the access-token with the header
      options.headers['Authorization'] = 'Bearer $_token';
    }
    // continue with the request
    super.onRequest(options, handler);
  }

  bool _needAuthorizationHeader(RequestOptions options) {
    if (options.method == 'GET') {
      return false;
    } else {
      return true;
    }
  }
}
