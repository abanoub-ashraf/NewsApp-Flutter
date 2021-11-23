import 'package:flutter/material.dart';

class BackgroundNotificationsScreen extends StatefulWidget {
    const BackgroundNotificationsScreen({ Key? key }) : super(key: key);

    @override
    _BackgroundNotificationsScreenState createState() => _BackgroundNotificationsScreenState();
}

class _BackgroundNotificationsScreenState extends State<BackgroundNotificationsScreen> {
    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.yellow,
            appBar: AppBar(
                title: const Text('Background Notifications Screen'),
                centerTitle: true,
            ),
            body: const Center(
                child: Text(
                    'THIS IS THE BACKGROUND NOTIFICATION PAGE',
                    style: TextStyle(
                        color: Colors.white,
                    ),
                ),
            ),
        );
    }
}