import 'package:asman_work/data/clients/remote/http_client.dart';
import 'package:asman_work/data/clients/remote/network_exeptions.dart';

import 'package:asman_work/data/model/user.dart';
import 'package:asman_work/utils/globals/end_points.dart';
import 'package:dio/dio.dart';

class UserProvider {
  final DioClient _dio = DioClient(baseUrl: APIEndPoints.baseUrlUser);
}
