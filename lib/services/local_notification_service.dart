import 'package:api_fetch/screens/foreground_notifications_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
    static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

    static void initializeLocalNotificationsPlugin(BuildContext context) {
        const AndroidInitializationSettings androidSettings = AndroidInitializationSettings(
            '@mipmap/ic_launcher'
        );

        const InitializationSettings initializationSettings = InitializationSettings(
            android: androidSettings
        );
        
        _notificationsPlugin.initialize(
            initializationSettings,
            onSelectNotification: (String? payload) async {
                if (payload != null) {
                    Navigator.of(context).pushNamed(payload);
                }
            }
        );
    }

    static void showNotification(RemoteMessage message) async {
        try {
            final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

            const androidNotification = AndroidNotificationDetails(
                'test', 
                'channel name',
                channelDescription: 'channel description',
                importance: Importance.high,
                priority: Priority.high
            );

            const notificationDetails = NotificationDetails(
                android: androidNotification,
            );

            _notificationsPlugin.show(
                id, 
                message.notification?.title, 
                message.notification?.body, 
                notificationDetails,
                payload: message.data['route'],
            );
        } on Exception catch (exception) {
            print(exception);
        }
    }
}