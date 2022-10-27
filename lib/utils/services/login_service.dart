import 'package:flutter/material.dart';

/// [LoginService] is a class that listens for login and logout event and
/// triggers rediarection of appropirate Screen
class LoginService extends ChangeNotifier {
  /// The userToken of login.
  //String get userToken => _userToken;
  String _userToken = '';

  /// Whether a user has logged in.
  bool get loggedIn => _userToken.isNotEmpty;

  /// Logs in a user.
  void login(String userToken) {
    _userToken = userToken;
    notifyListeners();
  }

  /// Logs out the current user.
  void logout() {
    _userToken = '';
    notifyListeners();
  }
}
