import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'local_notification_manager.dart';
import 'model/notification_message.dart';

class FirebaseNotificationManager {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> registerNotification() async {
    // Notification Settings
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    /// Check if Permission to request Notification has been granted
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        // FlutterRingtonePlayer.playNotification();
        _showNotification(message);
      });

      // Background Messaging
    }
  }

  void _showNotification(RemoteMessage message) {
    debugPrint(message.data.toString());

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      // Set Notification Message Object
      NotificationMessage notificationMessage = NotificationMessage(
        id: notification.hashCode,
        title: notification.title!,
        body: notification.body!,
      );

      // Call Notification Manager to show Notification
      LocalNotificationManager.showNotification(notificationMessage);
    }
  }

  Future<String?> get deviceToken async {
    return await messaging.getToken();
  }
}
