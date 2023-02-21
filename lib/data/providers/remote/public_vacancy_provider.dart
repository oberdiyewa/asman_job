import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/model/public_entity.dart';
import 'package:asman_work/data/model/public_vacancy_detail.dart';
import 'package:asman_work/data/providers/remote/provider_mixin.dart';
import 'package:asman_work/data/repository/repository.dart';
import 'package:asman_work/utils/globals/end_points.dart';
import 'package:asman_work/utils/globals/enums.dart';
import 'package:latlong2/latlong.dart';

class PublicVacancyProvider with IProviderMixin {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.kBaseUrl);

  Future<List<PublicEntity>> getPublicVacancies(
    LatLng loc,
    int page, {
    String title = '',
    bool forSearch = false,
  }) async {
    final response = await _dio.get(
      APIEndPoints.kUsersVacancyPath(EnumUserVacancyPaths.search),
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
      PublicVacancyRepository().searchPage =
          (responseBody['meta'] as Map)['last_page'] as int;
      print(
          '@@@@@@@@@@@@@@@@@@@@@@@@ search ${PublicVacancyRepository().searchPage}');
    } else {
      PublicVacancyRepository().totalPage =
          (responseBody['meta'] as Map)['last_page'] as int;
      print(
          '@@@@@@@@@@----@@@@@@@@@@@@@@ ${PublicVacancyRepository().totalPage}');
    }

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    final rawVacancyList =
        List<Map<String, dynamic>>.from(responseBody['data'] as List);
    return rawVacancyList.map<PublicEntity>(PublicEntity.fromMap).toList();
  }

  Future<PublicVacancyDetail> getVacancyDetail(
    LatLng loc,
    int id,
  ) async {
    final response = await _dio.get(
      APIEndPoints.kUsersVacancyPath(EnumUserVacancyPaths.details, id),
      headers: headers,
      queryParameters: <String, dynamic>{
        'lat': loc.latitude,
        'lng': loc.longitude,
      },
    );

    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    final rawVacancyDetail = responseBody['data'] as Map<String, dynamic>;
    return PublicVacancyDetail.fromMap(rawVacancyDetail);
  }
}
