import 'package:flutter/material.dart';

import 'package:sharemore/utilities/colors.dart';

class Topbar extends StatelessWidget {
  const Topbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading:,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Share",
            style: TextStyle(color: primaryColor),
          ),
          Text(
            "more",
            style: TextStyle(color: secondaryColor),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.brightness_4_rounded,
          ),
        )
      ],
    );
  }
}
