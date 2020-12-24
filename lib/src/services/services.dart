import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodee/src/services/mixins/notifications_service_mixin.dart';

abstract class AppServices with NotificationsServiceMixin {
  /// Determines whether [initialize] has been called or not;
  static bool _initialized;

  /// Determines whether [bindUiContext] has been called or not;
  static bool _boundToUi;

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

    await Firebase.initializeApp();
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

    NotificationsServiceMixin.bindUiContext(context);
    _boundToUi = true;
  }
}
