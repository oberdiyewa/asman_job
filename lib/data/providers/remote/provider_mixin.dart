import 'package:asman_work/app/services/shared_prefs_manager.dart';
import 'package:asman_work/data/clients/remote/interceptors/app_interceptors.dart';
import 'package:asman_work/utils/globals/my_http_headers.dart';

mixin IProviderMixin {
  final headers = <String, dynamic>{
    MyHttpHeaders.acceptLanguageHeader:
        SharedPrefsManager.instance!.getLangCode(),
    ...MyHttpHeaders.commonHeaders,
  };

  void checkError(Map<String, dynamic> responseBody) {
    if (responseBody.containsKey('errors')) {
      throw ServerMessageException(responseBody['message'] as String);
    }
  }
}
