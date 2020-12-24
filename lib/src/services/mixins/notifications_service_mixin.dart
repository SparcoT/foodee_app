import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

typedef NotificationHandler = FutureOr<void> Function(
  BuildContext,
  RemoteMessage,
);

typedef BackgroundNotificationHandler = FutureOr<void> Function(RemoteMessage);

mixin NotificationsServiceMixin {
  static _NotificationsService _instance;

  static void initialize() => _instance = _NotificationsService();

  static void bindUiContext(BuildContext context) =>
      _instance._context = context;

  _NotificationsService get notifications {
    if (_instance != null) return _instance;

    throw '[NotificationServiceMixin] is not yet initiated, '
        'call [NotificationServiceMixin.initialize] in [AppService.initiate]';
  }
}

class _NotificationsService {
  BuildContext _context;
  NotificationHandler _appOpenHandler;
  Set<NotificationHandler> _messageHandlers;

  _NotificationsService([this._context]) {
    FirebaseMessaging.onMessage.listen((event) {
      if (_context == null) print('This Service has not been bound to Ui-Context');
      _messageHandlers.forEach((element) => element?.call(_context, event));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      if (_context == null) print('This Service has not been bound to Ui-Context');
      _appOpenHandler?.call(_context, event);
    });
  }

  void registerBackgroundHandler(BackgroundNotificationHandler handler) =>
      FirebaseMessaging.onBackgroundMessage(handler);

  void registerHandler(NotificationHandler handler) =>
      _messageHandlers.add(handler);

  void registerOnAppOpen(NotificationHandler handler) =>
      _appOpenHandler = handler;

  void unregisterBackgroundHandler() =>
      FirebaseMessaging.onBackgroundMessage(null);

  void unregisterAllHandlers() => _messageHandlers.clear();

  void unregisterHandler(NotificationHandler handler) =>
      _messageHandlers.remove(handler);

  void unregisterOnAppOpen() => _appOpenHandler = null;
}
