import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/remote/user_profile_provider.dart';

final UserProfileProvider _provider = UserProfileProvider();

class UserProfileRepository {
  factory UserProfileRepository() {
    return _userProfileRepository;
  }
  UserProfileRepository._();

  static final UserProfileRepository _userProfileRepository =
      UserProfileRepository._();

  int userProfileTotalPage = 0;

  Future<List<PublicProfileDetail>> userProfileList({required int page}) async {
    final profileList = await _provider.getUserProfileList(
      page,
    );
    return profileList;
  }

  Future<UserProfile> userProfile(int id) async {
    return _provider.getUserProfile(id);
  }

  Future<bool> userProfileDelete(int id) async {
    return _provider.deleteUserProfile(id);
  }
}
