import 'package:flutter/material.dart';

import 'package:sharemore/utilities/colors.dart';
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
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: "Sharemore App",
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}

// class MainContainer extends StatelessWidget {
//   const MainContainer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TextTheme _textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       drawer: Sidebar(),
//       appBar: AppBar(
//         // leading:,
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Share",
//               style: TextStyle(color: primaryColor),
//             ),
//             Text(
//               "more",
//               style: TextStyle(color: secondaryColor),
//             )
//           ],
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.brightness_4_rounded,
//             ),
//           )
//         ],
//       ),
//       body: Home(),
//     );
//   }
// }
