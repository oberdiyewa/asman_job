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

  Future<List<Profile>> userProfileList() async {
    final profileList = await _provider.getUserProfileList();
    return profileList;
  }

  Future<Profile> userProfile(int id) async {
    return _provider.getUserProfile(id);
  }

  Future<bool> userProfileAdd(Map<String, dynamic> data) async {
    return _provider.addUserProfile(data);
  }

  Future<bool> userProfileUpdate(Map<String, dynamic> data, int id) async {
    return _provider.updateUserProfile(data, id);
  }

  Future<bool> userProfileDelete(int id) async {
    return _provider.deleteUserProfile(id);
  }
}
