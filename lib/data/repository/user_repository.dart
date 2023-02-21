import 'package:asman_work/data/model/model.dart';
import 'package:asman_work/data/providers/remote/user_provider.dart';

final UserProvider _provider = UserProvider();
class UserRepository {
  factory UserRepository() {
    return _userRepository;
  }
  UserRepository._();

  static final UserRepository _userRepository = UserRepository._();


  Future<User> remoteUser() async {
    final user = await _provider.getUserRemote();
    return user;
  }
}
