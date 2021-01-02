part of '../data.dart';

class AppAuthData {
  AppAuthData._();

  static Box<AuthData> _box;
  static Future<void> initiate() async {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(AuthDataAdapter());

    _box = await Hive.openBox<AuthData>('user_data');
  }

  void update(AuthData data) {
    _box.add(data);
    data.save();
  }

  bool get isAuthenticated => _box.isNotEmpty;
  User get user => _data.user;
  String get token => _data.token;

  AuthData get _data {
    if (isAuthenticated) {
      return _box.values.last;
    } else {
      throw 'User is not Authenticated';
    }
  }
}
