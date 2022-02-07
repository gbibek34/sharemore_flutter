import 'package:flutter/material.dart';

import 'package:sharemore/screens/home.dart';
import 'package:sharemore/screens/login.dart';
import 'package:sharemore/screens/post_list.dart';
import 'package:sharemore/screens/post_write.dart';
import 'package:sharemore/utilities/colors.dart';
import 'package:sharemore/screens/profile.dart';
import 'package:sharemore/utilities/token_storage.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Drawer(
          child: Material(
            color: backgroundColor,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 30, bottom: 40),
                      width: double.infinity,
                      color: backgroundColor,
                      child: Text(
                        "Sharemore",
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      height: 420,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          menuItems(
                            text: "Home",
                            icon: Icons.home,
                            onClicked: () => selectedItem(context, 0),
                          ),
                          menuItems(
                            text: "My Posts",
                            icon: Icons.feed,
                            onClicked: () => selectedItem(context, 1),
                          ),
                          menuItems(
                            text: "Write",
                            icon: Icons.edit,
                            onClicked: () => selectedItem(context, 2),
                          ),
                          menuItems(
                            text: "Categories",
                            icon: Icons.grid_3x3,
                            onClicked: () => selectedItem(context, 0),
                          ),
                          menuItems(
                            text: "More",
                            icon: Icons.menu_open,
                            onClicked: () => selectedItem(context, 0),
                          ),
                          menuItems(
                            text: "My Profile",
                            icon: Icons.person,
                            onClicked: () => selectedItem(context, 5),
                          ),
                          menuItems(
                              text: "Logout",
                              icon: Icons.login_outlined,
                              onClicked: () {
                                selectedItem(context, 6);
                                removeToken();
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget menuItems({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = primaryColor;
  final hoverColor = secondaryColor;

  return ListTile(
    contentPadding: EdgeInsets.only(left: 30),
    leading: Icon(icon, color: color),
    title: Text(text),
    hoverColor: hoverColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
      break;
    case 1:
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
          builder: (context) => PostList(),
        ),
      );
      break;
    case 2:
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
          builder: (context) => PostWrite(),
        ),
      );
      break;
    case 5:
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
          builder: (context) => Profile(),
        ),
      );
      break;
    case 6:
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
      break;
  }
}
