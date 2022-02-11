import 'package:flutter/material.dart';
import 'package:sharemore/screens/login.dart';

import 'package:sharemore/utilities/colors.dart';
import 'package:sharemore/utilities/token_storage.dart';
import 'package:sharemore/widgets/sidebar.dart';
import 'package:sharemore/utilities/themes.dart';
import 'package:sharemore/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {});
    checkToken();
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
