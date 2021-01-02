import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:foodee/src/services/services.dart';

typedef NotificationHandler = FutureOr<void> Function(
  BuildContext,
  RemoteMessage,
);

typedef BackgroundNotificationHandler = FutureOr<void> Function(RemoteMessage);

mixin NotificationsServiceMixin {
  static _NotificationsService _instance;

  static void initialize() => _instance = _NotificationsService();

  _NotificationsService get notifications {
    if (_instance != null) return _instance;

    throw '[NotificationServiceMixin] is not yet initiated, '
        'call [NotificationServiceMixin.initialize] in [AppService.initiate]';
  }
}

class _NotificationsService {
  NotificationHandler _appOpenHandler;
  Set<NotificationHandler> _messageHandlers;

  _NotificationsService() {
    FirebaseMessaging.onMessage.listen((event) {
      _messageHandlers.forEach(
        (element) => element?.call(
          AppServices.context,
          event,
        ),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      _appOpenHandler?.call(AppServices.context, event);
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
