// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:print_color/print_color.dart';

import 'app/app_widget.dart';
import 'package:flutter/material.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
    Print.blue('background handler....');
    print(message.data.toString());
    print(message.notification!.title);
}

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    
    runApp(
        const AppWidget()
    );
}