import 'package:asmanshop/data/clients/remote/http_client.dart';
import 'package:asmanshop/data/clients/remote/network_exeptions.dart';

import 'package:asmanshop/data/model/user.dart';
import 'package:asmanshop/utils/globals/end_points.dart';
import 'package:dio/dio.dart';

class UserProvider {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.baseUrlUser);

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final resp = await _dio.post(
        endPoint: APIEndPoints.loginUserPost,
        data: {'email': email, 'password': password},
      );
      if (resp.data != null &&
          resp.data is Map<String, dynamic> &&
          resp.statusCode == 200) {
        return User.fromJson(resp.data! as Map<String, dynamic>);
      }
    } on DioError catch (err, stack) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      return Error.throwWithStackTrace(
        errorMessage,
        stack,
      );
    } catch (e, s) {
      return Error.throwWithStackTrace(e, s);
    }
    return null;
  }

  Future<bool> logOut() {
    return Future.value(true);
  }
}
