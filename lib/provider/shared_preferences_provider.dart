import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider with ChangeNotifier {
  static SharedPreferences? _prefs;
  static const String prefsKeyListSorting = 'sort_value';
  static const String prefsKeyAuthorization = 'auth_key';
  static const String prefsKeyUserId = 'user_key';

  static Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String getListSorting() {
    return _prefs?.getString(prefsKeyListSorting) ?? "Цена по возврастанию";
  }

  bool getAuthValue() {
    return _prefs?.getBool(prefsKeyAuthorization) ?? false;
  }

  int getUserId() {
    return _prefs?.getInt(prefsKeyUserId) ?? -1;
  }

  void saveAuthValue(bool value) {
    _prefs?.setBool(prefsKeyAuthorization, value);
    notifyListeners();
  }

  void saveUserId(int value) {
    _prefs?.setInt(prefsKeyUserId, value);
    notifyListeners();
  }

  void saveListSorting(String value) {
    _prefs?.setString(prefsKeyListSorting, value);
    notifyListeners();
  }

  void clearPreferences() {
    _prefs?.clear();
  }
}
