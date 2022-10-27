import 'dart:async';

import 'package:asmanshop/data/model/user.dart';

import 'package:asmanshop/data/providers/remote/user_provider.dart';

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
