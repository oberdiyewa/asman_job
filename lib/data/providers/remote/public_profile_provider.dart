import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/remote/provider_mixin.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:asman_work/utils/globals/end_points.dart';
import 'package:latlong2/latlong.dart';

class PublicProfileProvider with IProviderMixin {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.kBaseUrl);

  Future<List<PublicEntity>> getPublicProfiles(
    LatLng loc,
    int page, {
    String title = '',
    bool forSearch = false,
  }) async {
    final response = await _dio.get(
      APIEndPoints.kUserProfileSearchPath,
      headers: headers,
      queryParameters: <String, dynamic>{
        'lat': loc.latitude,
        'lng': loc.longitude,
        'page': page.toString(),
        'title': title,
      },
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Get total page
    if (forSearch) {
      PublicProfileRepository().totalPageOfSearch =
          (responseBody['meta'] as Map)['last_page'] as int;
      print(
          '@@@@@@@@@@@@@@@@@@@@@@@@ search ${PublicProfileRepository().totalPageOfSearch}');
    } else {
      PublicProfileRepository().totalPage =
          (responseBody['meta'] as Map)['last_page'] as int;
      print('@@@@@@@@@@@@@@@@@@@@@@@@ ${PublicProfileRepository().totalPage}');
    }

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    final rawProfileList =
        List<Map<String, dynamic>>.from(responseBody['data'] as List);
    return rawProfileList.map<PublicEntity>(PublicEntity.fromMap).toList();
  }

  Future<PublicProfileDetail> getProfileDetail(
    LatLng loc,
    int id,
  ) async {
    final response = await _dio.get(
      APIEndPoints.kUserProfilePathWithId(id, needDetails: true),
      headers: headers,
      queryParameters: <String, dynamic>{
        'lat': loc.latitude,
        'lng': loc.longitude,
      },
    );

    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    final rawProfileDetail = responseBody['data'] as Map<String, dynamic>;
    return PublicProfileDetail.fromMap(rawProfileDetail);
  }
}
