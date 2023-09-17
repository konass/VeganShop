import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_online_shop/componets/drop_down_items.dart';

class SharedPreferencesProvider with ChangeNotifier {
  late SharedPreferences _prefs;
  String _selectedValue = priceIncreasing;
  static const String prefsValue = 'sort_value';

  SharedPreferencesProvider() {
    initPreferences();
  }

  String get selectedValue => _selectedValue;

  Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    _selectedValue = _prefs.getString(prefsValue) ?? priceIncreasing;
    return notifyListeners();
  }


  String returnValue() {
    return _prefs.getString(prefsValue) ?? priceIncreasing;
  }

  void saveToSharedPreferences(String value) {
    _prefs.setString(prefsValue, value);
    notifyListeners();
  }
}
