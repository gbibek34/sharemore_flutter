import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shake/shake.dart';

import 'package:sharemore/screens/login.dart';
import 'package:sharemore/screens/home.dart';

import 'package:sharemore/utilities/colors.dart';
import 'package:sharemore/utilities/token_storage.dart';
import 'package:sharemore/utilities/themes.dart';

void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic notifications',
      channelDescription: 'Basic notifications for post creation',
      defaultColor: primaryColor,
      importance: NotificationImportance.High,
      channelShowBadge: true,
      playSound: true,
      enableLights: true,
      enableVibration: true,
      ledColor: Colors.white,
    )
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;
  ShakeDetector? detector;
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {});
    checkToken();
    ShakeDetector.autoStart(onPhoneShake: () {
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    });
  }

  checkToken() async {
    String? temp_token = await loadToken();
    setState(() {
      token = temp_token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: token != null && token != '' ? Home() : Login(),
      title: "Sharemore App",
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}
