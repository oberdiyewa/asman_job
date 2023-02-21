import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/model/service_adress.dart';
import 'package:asman_work/data/providers/remote/provider_mixin.dart';
import 'package:asman_work/utils/globals/end_points.dart';

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
}
