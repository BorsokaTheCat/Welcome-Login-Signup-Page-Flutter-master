import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'Screens/Greeting/first.dart';
/*
void main() => runApp(MyApp());*/

//TODO for ios set the name: https://stackoverflow.com/questions/49353199/how-can-i-change-the-app-display-name-build-with-flutter
//TODO set the icon: https://stackoverflow.com/questions/43928702/how-to-change-the-application-launcher-icon-on-flutter

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          debugPrint('notification payload: ' + payload);
        }
      });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: FirstGreetingPage(),
    );
  }
}
