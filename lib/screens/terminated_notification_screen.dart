import 'package:flutter/material.dart';

class TerminatedNotificationsScreen extends StatefulWidget {
    const TerminatedNotificationsScreen({ Key? key }) : super(key: key);

    @override
    _TerminatedNotificationsScreenState createState() => _TerminatedNotificationsScreenState();
}

class _TerminatedNotificationsScreenState extends State<TerminatedNotificationsScreen> {
    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.indigo,
            appBar: AppBar(
                title: const Text('Terminated Notifications Screen'),
                centerTitle: true,
                // actions: [
                //     IconButton(
                //         onPressed: () {
                //             Navigator.pop(context);
                //         }, 
                //         icon: const Icon(
                //             Icons.backspace, 
                //             size: 22,
                //         ),
                //     ),
                // ],
            ),
            body: const Center(
                child: Text(
                    'THIS IS THE TERMINATED NOTIFICATION PAGE',
                    style: TextStyle(
                        color: Colors.white,
                    ),
                ),
            ),
        );
    }
}