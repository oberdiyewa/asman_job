import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/clients/remote/interceptors/app_interceptors.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/utils/globals/end_points.dart';
import 'package:asman_work/utils/globals/my_http_headers.dart';

class UserProvider with IUserProviderMixin {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.kBaseUrl);

  Future<User> getUserRemote() async {
    final response = await _dio.get(
      APIEndPoints.kUsersStatePath,
      headers: header,
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    final responseData = responseBody['data'] as Map<String, dynamic>;
    final rawMeMap = responseData['me'] as Map<String, dynamic>;

    return User.fromMap(rawMeMap);
  }
}

mixin IUserProviderMixin {
  final header = {
    ...MyHttpHeaders.commonHeaders,
  };
  void checkError(Map<String, dynamic> responseBody) {
    if (responseBody.containsKey('error')) {
      throw ServerMessageException(responseBody['message'] as String);
    }
  }
}
