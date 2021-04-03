import 'package:shared_preferences/shared_preferences.dart';

mixin LocalData {
  static SharedPreferences _sharedPreferences;
  static final _token = 'Token';
  static final _id = 'UserId';

  static Future<void> initialize() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  Future<void> setToken(String token) async =>
      await _sharedPreferences.setString(_token, token);

  String getToken() => _sharedPreferences.getString(_token) ?? '';

  Future<void> setUserId(int userId) async =>
      await _sharedPreferences.setInt(_id, userId);

  int getUserId() => _sharedPreferences.getInt(_id);

  bool hasData() => _sharedPreferences.getKeys().isNotEmpty;

  Future<void> clearData() async => await _sharedPreferences.clear();
}
