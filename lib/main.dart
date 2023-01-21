import 'package:flutter/material.dart';
import 'package:school_app/screens/imageScreen.dart';
import 'package:school_app/screens/mainScreen.dart';
import 'package:school_app/screens/inboxScreen.dart';
import 'package:school_app/screens/eventCalendar.dart';
import 'package:school_app/screens/startScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'appData.dart';
import 'package:provider/provider.dart';
import 'package:school_app/screens/emailScreen.dart';
import 'package:school_app/screens/imageScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
            initialRoute: 'MainScreen',
            routes: {
              'StartScreen': (context) => StartScreen(),
              'InboxScreen': (context) => InboxScreen(),
              'EventsScreen': (context) => EventsScreen(),
              'MainScreen': (context) => MainScreen(),
              'EmailScreen': (context) => EmailScreen(),
              'ImageScreen': (context) => ImageScreen(),
            }
        ),
    );
  }
}

