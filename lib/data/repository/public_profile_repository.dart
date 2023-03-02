import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/remote/public_profile_provider.dart';

import 'package:latlong2/latlong.dart';

final PublicProfileProvider _provider = PublicProfileProvider();

class PublicProfileRepository {
  factory PublicProfileRepository() => _publicProfileRepository;
  PublicProfileRepository._();

  static final PublicProfileRepository _publicProfileRepository =
      PublicProfileRepository._();

  int totalPage = 1;
  int totalPageOfSearch = 1;

  Future<List<PublicEntity>> publicProfiles({
    required int page,
    String title = '',
    bool forSearch = false,
  }) async {
    return _provider.getPublicProfiles(
      LatLng(37.560006, 58.456789),
      page,
      title: title,
      forSearch: forSearch,
    );
  }

  Future<Profile> profileDetail(int id) async {
    return _provider.getProfileDetail(
      LatLng(37.560006, 58.456789),
      id,
    );
  }
}
