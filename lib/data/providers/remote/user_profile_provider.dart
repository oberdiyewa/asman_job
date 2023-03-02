import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/remote/provider_mixin.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:asman_work/utils/globals/end_points.dart';

class UserProfileProvider with IProviderMixin {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.kBaseUrl);

  Future<List<Profile>> getUserProfileList() async {
    final response = await _dio.get(
      APIEndPoints.kUserProfileListPath,
      headers: headers,
      queryParameters: <String, dynamic>{
        // 'page': page.toString(),
      },
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Get total page
    if (responseBody['meta'] != null) {
      UserProfileRepository().userProfileTotalPage =
          (responseBody['meta'] as Map)['last_page'] as int;
    }

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    final rawProfileList =
        List<Map<String, dynamic>>.from(responseBody['data'] as List);
    return rawProfileList.map<Profile>(Profile.fromMap).toList();
  }

  Future<Profile> getUserProfile(int id) async {
    final response = await _dio.get(
      APIEndPoints.kUserProfilePathWithId(id),
      headers: headers,
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    final rawUserProfile = responseBody['data'] as Map<String, dynamic>;
    return Profile.fromMap(rawUserProfile);
  }

  Future<bool> addUserProfile(Map<String, dynamic> data) async {
    final response = await _dio.post(
      endPoint: APIEndPoints.kUserProfilePath,
      headers: headers,
      data: data,
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    return responseBody['success'] as bool;
  }

  Future<bool> updateUserProfile(Map<String, dynamic> data, int id) async {
    final response = await _dio.patch(
      endPoint: APIEndPoints.kUserProfilePathWithId(id),
      headers: headers,
      data: data,
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    return responseBody['success'] as bool;
  }

  Future<bool> deleteUserProfile(int id) async {
    final response = await _dio.delete(
      APIEndPoints.kUserProfilePathWithId(id),
      headers: headers,
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    return responseBody['success'] as bool;
  }
}
