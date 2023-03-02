import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/model/user_catalogue/user_catalogue.dart';
import 'package:asman_work/data/providers/remote/provider_mixin.dart';
import 'package:asman_work/utils/globals/end_points.dart';
import 'package:asman_work/utils/globals/enums.dart';

class UserCatalogueProvider with IProviderMixin {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.kBaseUrl);

  Future<UserCatalogue> fetchUserCatalogue() async {
    final response = await _dio.get(
      APIEndPoints.kUserCataloguePath,
      headers: headers,
      queryParameters: <String, dynamic>{
        'include': EnumUserCatalogueQueries.values.map((e) => e.name).join(','),
        // 'include':
        //     'industry,employment_type,language,education_type,specializations,profile_avatars,vacancy_avatars',
      },
    );
    final responseBody = response.data as Map<String, dynamic>;

    // Method from mixin; checks if server gives error message
    checkError(responseBody);
    final rawCatalogue = responseBody['data'] as Map<String, dynamic>;
    return UserCatalogue.fromMap(rawCatalogue);
  }
}
