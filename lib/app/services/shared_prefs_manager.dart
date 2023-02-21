import 'package:asman_work/app/sh_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {

  factory SharedPrefsManager(SharedPreferences prefs) {
    return instance ??= SharedPrefsManager._(prefs);
  }

  SharedPrefsManager._(this._prefs);
  final SharedPreferences _prefs;

  static SharedPrefsManager? instance;

  String getLangCode() {
    return instance!._prefs.getString(SharedPrefKeys.languageCode) ??
        SharedPrefKeys.defaultLanguage;
  }

  Future<bool>? setLangCode(String code) {
    return instance!._prefs.setString(SharedPrefKeys.languageCode, code);
  }
}
