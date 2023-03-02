import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/model/service_adress.dart';
import 'package:asman_work/data/providers/remote/provider_mixin.dart';
import 'package:asman_work/utils/globals/end_points.dart';
import 'package:latlong2/latlong.dart';

class ServicesProvider with IProviderMixin {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.kBaseUrl);

  Future<List<ServiceAddress>> getSearchedAddressList(String street) async {
    final response = await _dio.get(
      APIEndPoints.kAddressSearch,
      headers: headers,
      queryParameters: <String, dynamic>{
        'street': street,
      },
    );

    final responseBody = response.data as Map<String, dynamic>;
    final rawData =
        List<Map<String, dynamic>>.from(responseBody['data'] as List);

    return rawData.map<ServiceAddress>(ServiceAddress.fromMap).toList();
  }

  Future<ServiceAddress> getAddressByPoint(LatLng point) async {
    final response = await _dio.get(
      APIEndPoints.kAddressreverse,
      headers: headers,
      queryParameters: <String, dynamic>{
        'lat': point.latitude,
        'lng': point.longitude,
      },
    );
    final responseBody = response.data as Map<String, dynamic>;
    final rawData = responseBody['data'] as Map<String, dynamic>;
    return ServiceAddress.fromMap(rawData);
  }

  Future<bool> addAddress(Map<String, dynamic> data, int profileId) async {
    final response = await _dio.post(
      endPoint: APIEndPoints.kUserProfileAddressPath(profileId),
      headers: headers,
      data: data,
    );

    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);

    return responseBody['success'] as bool;
  }
}
