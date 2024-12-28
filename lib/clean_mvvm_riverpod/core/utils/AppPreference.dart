import 'package:shared_preferences/shared_preferences.dart';
import 'enums.dart';

class AppPreference {
  final SharedPreferences _prefs;

  AppPreference(this._prefs);

  Future<void> setStringPref(PrefKey key, String value) async {
    await _prefs.setString(key.toString(), value);
  }

  Future<void> setBooleanPref(PrefKey key, bool value) async {
    await _prefs.setBool(key.toString(), value);
  }

  Future<void> setIntPref(PrefKey key, int value) async {
    await _prefs.setInt(key.toString(), value);
  }

  Future<void> setDoublePref(PrefKey key, double value) async {
    await _prefs.setDouble(key.toString(), value);
  }

  Future<String> getStringPref(PrefKey key) async {
    return _prefs.getString(key.toString()) ?? "";
  }

  Future<bool> getBooleanPref(PrefKey key) async {
    return _prefs.getBool(key.toString()) ?? false;
  }

  Future<int> getIntPref(PrefKey key) async {
    return _prefs.getInt(key.toString()) ?? 0;
  }

  Future<double> getDoublePref(PrefKey key) async {
    return _prefs.getDouble(key.toString()) ?? 0.0;
  }

  Future<void> logout() async {
    await _prefs.clear();
  }
}
