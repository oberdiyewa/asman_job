import 'package:asman_work/data/repository/repository.dart';
import 'package:asman_work/utils/globals/my_http_headers.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = TokenRepository().getAccessToken;
    // print('***************** $token');
    options.headers[MyHttpHeaders.authorizationHeader] = 'Bearer $token';
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        throw DeadlineExceededException(requestOptions: err.requestOptions);
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(requestOptions: err.requestOptions);
          case 401:
            throw UnAuthorizedException(requestOptions: err.requestOptions);
          case 404:
            throw NotFoundException(requestOptions: err.requestOptions);
          case 409:
            throw ConflictException(requestOptions: err.requestOptions);
          case 500:
            throw InternalServerErrorException(
                requestOptions: err.requestOptions,);
        }
        break;

      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw NoInternetConnectionException(requestOptions: err.requestOptions);
      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioErrorType.connectionError:
        // TODO: Handle this case.
        break;
    }
    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException({required super.requestOptions});

  @override
  String toString() => 'Invalid quest';
}

class ConflictException extends DioError {
  ConflictException({required super.requestOptions});

  @override
  String toString() => 'Conflict occured';
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException({required super.requestOptions});

  @override
  String toString() => 'The connection has timed out, please try again.';
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException({required super.requestOptions});

  @override
  String toString() => 'Unknown error occured, please try again later';
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException({required super.requestOptions});

  @override
  String toString() =>
      'No internet connection detected, please try again later.';
}

class NotFoundException extends DioError {
  NotFoundException({required super.requestOptions});

  @override
  String toString() => 'The requested information could not be found';
}

class UnAuthorizedException extends DioError {
  UnAuthorizedException({required super.requestOptions});

  @override
  String toString() => 'Access denied';
}

class ServerMessageException implements Exception {

  ServerMessageException(this.message);
  final String message;
  @override
  String toString() {
    return message;
  }
}
