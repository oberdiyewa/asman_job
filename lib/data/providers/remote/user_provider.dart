import 'package:asman_work/data/clients/remote/http_client.dart';

import 'package:asman_work/utils/globals/end_points.dart';

class UserProvider {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.baseUrlUser);


}
