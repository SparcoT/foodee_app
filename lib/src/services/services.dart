import 'package:flutter/cupertino.dart';

import 'mixins/auth_mixin.dart';
import 'mixins/notifications_service_mixin.dart';

class AppServices with NotificationsServiceMixin,
    AuthServiceMixin
{
  static BuildContext _context;
  static BuildContext get context {
    if (_context == null) print('[AppServices] is not yet bound to UI');
    return _context;
  }

  /// Determines whether [initialize] has been called or not;
  static var _initialized = false;

  /// Determines whether [bindUiContext] has been called or not;
  static var _boundToUi = false;

  /// Initiates base services.
  ///
  /// Must be called in [App.initializeAndRun] so, that all the required
  /// services are ready to be used when the app starts.
  static Future<void> initialize() async {
    if (_initialized) {
      print('[AppServices] have already been initialized call `AppService()` to'
          'use available services;');

      return;
    }

  //  await Firebase.initializeApp();
    NotificationsServiceMixin.initialize();

    _initialized = true;
  }

  /// Binds services to [BuildContext] for ui manipulation.
  ///
  /// Must be called before or after building the first widget of application.
  /// It is necessary for some services to communicate to Ui while processing
  /// data at the backend.
  static void bindUiContext(BuildContext context) {
    if (_boundToUi) {
      print('[AppServices] have already been bound to Ui Context');
      return;
    }

    _context = context;
    _boundToUi = true;
  }
}
