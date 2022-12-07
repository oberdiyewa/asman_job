// import 'dart:io';

// import 'package:dio/dio.dart';

// import 'package:asman_work/data/clients/remote/interceptors/dio_connectivity_request_retrier.dart';

// class RetryOnConnectionChangeInterceptor extends Interceptor {
//   RetryOnConnectionChangeInterceptor({
//     required this.requestRetrier,
//   });
//   final DioConnectivityRequestRetrier requestRetrier;

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {

//     if (_shouldRetry(err)) {
//       try {
//         return requestRetrier.scheduleRequestRetry(err.requestOptions);
//       } catch (e) {
//         return e;
//       }
//     }
//     return super.onError(err, handler);
//   }

//   bool _shouldRetry(DioError err) {
//     return err.type == DioErrorType.other &&
//         err.error != null &&
//         err.error is SocketException;
//   }
// }
