import 'package:api_fetch/screens/home_screen.dart';
import 'package:flutter/material.dart';

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
        );
    }
}