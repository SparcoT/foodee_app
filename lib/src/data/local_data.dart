import 'package:shared_preferences/shared_preferences.dart';

mixin LocalData {
  static SharedPreferences _sharedPreferences;
  static final _token = 'Token';
  static final _id = 'UserId';
  static final _name = 'Name';
  static final _email = 'Email';
  static final _image = 'Image';

  static Future<void> initialize() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  Future<void> setToken(String token) async =>
      await _sharedPreferences.setString(_token, token);

  String getToken() => _sharedPreferences.getString(_token) ?? '';

  Future<void> setName(String name) async =>
      await _sharedPreferences.setString(_name, name);

  String getName() => _sharedPreferences.getString(_name) ?? '';

  Future<void> setEmail(String email) async =>
      await _sharedPreferences.setString(_email, email);

  String getEmail() => _sharedPreferences.getString(_email) ?? '';

  Future<void> setImage(String image) async =>
      await _sharedPreferences.setString(_image, image ?? '');

  String getImage() => _sharedPreferences.getString(_image) ?? '';

  Future<void> setUserId(int userId) async =>
      await _sharedPreferences.setInt(_id, userId);

  int getUserId() => _sharedPreferences.getInt(_id);

  bool hasData() => _sharedPreferences.getKeys().isNotEmpty;

  Future<void> clearData() async => await _sharedPreferences.clear();
}
