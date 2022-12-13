
import 'package:asman_work/data/model/user.dart';

import 'package:asman_work/data/providers/remote/user_provider.dart';

class UserRepository {
  User? _user;
  final UserProvider _provider = UserProvider();
}
