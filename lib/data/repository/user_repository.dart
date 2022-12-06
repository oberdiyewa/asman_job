import 'dart:async';

import 'package:asman_work/data/model/user.dart';

import 'package:asman_work/data/providers/remote/user_provider.dart';

class UserRepository {
  User? _user;
  final UserProvider _provider = UserProvider();

  Future<User?> getUser({
    required String email,
    required String password,
  }) async {
    if (_user != null) return _user;
    return _user = await _provider.login(email: email, password: password);
  }
}
