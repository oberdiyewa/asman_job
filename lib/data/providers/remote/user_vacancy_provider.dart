import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/model/user_vacancy.dart';
import 'package:asman_work/data/providers/remote/provider_mixin.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:asman_work/utils/globals/end_points.dart';
import 'package:asman_work/utils/globals/enums.dart';

class UserVacancyProvider with IProviderMixin {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.kBaseUrl);

  Future<List<UserVacancy>> getUserVacancyList(int page) async {
    final response = await _dio.get(
      APIEndPoints.kUsersVacancyPath(EnumUserVacancyPaths.list),
      headers: headers,
      queryParameters: <String, dynamic>{
        'page': page.toString(),
      },
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Get total page
    if (responseBody['meta'] != null) {
      UserVacancyRepository().userVacancyTotalPage =
          (responseBody['meta'] as Map)['last_page'] as int;
    }

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    final rawVacancyList =
        List<Map<String, dynamic>>.from(responseBody['data'] as List);
    return rawVacancyList.map<UserVacancy>(UserVacancy.fromMap).toList();
  }

  Future<UserVacancy> getUserVacancy(int id) async {
    final response = await _dio.get(
      APIEndPoints.kUsersVacancyPath(EnumUserVacancyPaths.none, id),
      headers: headers,
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    final rawUserVacancy = responseBody['data'] as Map<String, dynamic>;
    return UserVacancy.fromMap(rawUserVacancy);
  }

  Future<bool> addUserVacancy(Map<String, dynamic> data) async {
    final response = await _dio.post(
      endPoint: APIEndPoints.kUsersVacancyPath(EnumUserVacancyPaths.none),
      headers: headers,
      data: data,
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    return responseBody['success'] as bool;
  }

  Future<bool> updateUserVacancy(Map<String, dynamic> data, int id) async {
    final response = await _dio.patch(
      endPoint: APIEndPoints.kUsersVacancyPath(EnumUserVacancyPaths.none, id),
      headers: headers,
      data: data,
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    return responseBody['success'] as bool;
  }

  Future<bool> deleteUserVacancy(int id) async {
    final response = await _dio.delete(
      APIEndPoints.kUsersVacancyPath(EnumUserVacancyPaths.none, id),
      headers: headers,
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    return responseBody['success'] as bool;
  }
}
