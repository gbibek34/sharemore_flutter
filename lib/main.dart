// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:all_sensors/all_sensors.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:sharemore/screens/login.dart';
import 'package:sharemore/screens/home.dart';
import 'package:sharemore/screens/register.dart';

import 'package:sharemore/utilities/colors.dart';
import 'package:sharemore/utilities/token_storage.dart';
import 'package:sharemore/utilities/themes.dart';
import 'package:shake/shake.dart';

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
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];
  bool deviceShake = false;

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {});
    checkToken();
    ShakeDetector.autoStart(onPhoneShake: () {
      token != null && token != ""
          ? navigationKey.currentState?.pushNamed("/home")
          : navigationKey.currentState?.pushNamed("/register");
    });
    _streamSubscriptions.add(proximityEvents.listen((ProximityEvent event) {
      if (event.getValue() == true) {
        navigationKey.currentState?.pushNamed("/logout");
        removeToken();
      }
    }));
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
      navigatorKey: navigationKey,
      routes: {
        "/home": (context) => Home(),
        "/logout": (context) => Login(),
        "/register": (context) => Register(),
      },
    );
  }
}
