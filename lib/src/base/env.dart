import 'package:flutter/foundation.dart';

class AppEnv {
  static const isDev = kDebugMode;

  /// TODO: Add App Url here;
  static const apiUrl = '';
  static const logRequest = isDev;
}