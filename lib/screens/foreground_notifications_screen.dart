import 'package:flutter/material.dart';

class ForegroundNotificationsScreen extends StatefulWidget {
    const ForegroundNotificationsScreen({ Key? key }) : super(key: key);

    @override
    _ForegroundNotificationsScreenState createState() => _ForegroundNotificationsScreenState();
}

class _ForegroundNotificationsScreenState extends State<ForegroundNotificationsScreen> {
    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.green,
            appBar: AppBar(
                title: const Text('Foreground Notifications Screen'),
                centerTitle: true,
            ),
            body: const Center(
                child: Text(
                    'THIS IS THE FOREGROUND NOTIFICATION PAGE',
                    style: TextStyle(
                        color: Colors.white,
                    ),
                ),
            ),
        );
    }
}