import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/model/model.dart';

import 'package:asman_work/utils/globals/end_points.dart';
import 'package:asman_work/utils/globals/my_http_headers.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VacancyProvider {
  final DioClient _dio =
      DioClient(baseUrl: '${APIEndPoints.kBaseUrl}${APIEndPoints.kApiPath}');

  Future<List<Vacancy>> getPublicVacancies(LatLng loc, int page) async {
    try {
      final response = await _dio.get(
        APIEndPoints.kUsersVacancyPath(EnumUserVacancyPaths.search),
        headers: <String, dynamic>{
          MyHttpHeaders.acceptHeader: 'application/json',
          MyHttpHeaders.contentTypeHeader: 'application/json',
        },
        queryParameters: <String, dynamic>{
          'lat': loc.latitude,
          'lng': loc.longitude,
          'page': page.toString()
        },
      );
      final responseData = response.data as Map<String, dynamic>;
      final rawVacancyList =
          List<Map<String, dynamic>>.from(responseData['data'] as List);
      return rawVacancyList.map<Vacancy>(Vacancy.fromMap).toList();
    } on DioError {
      rethrow;
    }
  }
}
