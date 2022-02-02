import 'package:flutter/material.dart';
import 'package:sharemore/widgets/sidebar.dart';
import 'package:sharemore/widgets/topbar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: PreferredSize(
        child: Topbar(),
        preferredSize: Size(double.infinity, 60),
      ),
      body: SafeArea(
          child: Container(
        child: Text("Hello"),
      )),
    );
  }
}
