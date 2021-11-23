import 'package:api_fetch/screens/background_notifications_screen.dart';
import 'package:api_fetch/screens/foreground_notifications_screen.dart';
import 'package:api_fetch/screens/terminated_notification_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AppWidget extends StatefulWidget {
    const AppWidget({ Key? key }) : super(key: key);

    @override
    State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: Colors.indigo,
                ),
            ),
            home: const HomeScreen(),
            routes: {
                'foreground': (_) => const ForegroundNotificationsScreen(),
                'background': (_) => const BackgroundNotificationsScreen(),
                'terminated': (_) => const TerminatedNotificationsScreen(),
            },
        );
    }
}