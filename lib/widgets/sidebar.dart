import 'package:flutter/material.dart';
import 'package:sharemore/screens/home.dart';
import 'package:sharemore/utilities/colors.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 60, left: 30),
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
                        onClicked: () => selectedItem(context, 0),
                      ),
                      menuItems(
                        text: "Write",
                        icon: Icons.edit,
                        onClicked: () => selectedItem(context, 0),
                      ),
                      menuItems(
                        text: "More",
                        icon: Icons.menu,
                        onClicked: () => selectedItem(context, 0),
                      ),
                      menuItems(
                        text: "Categories",
                        icon: Icons.grid_3x3,
                        onClicked: () => selectedItem(context, 0),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (() => selectedItem(context, 0)),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    width: double.infinity,
                    color: primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: Image(
                              image: AssetImage("assets/images/user.jpg"),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          "Bibek Ghimire",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                )
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
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
      break;
  }
}
