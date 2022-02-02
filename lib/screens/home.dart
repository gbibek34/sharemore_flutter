import 'package:flutter/material.dart';

import '../widgets/post_card.dart';
import '../widgets/sidebar.dart';
import '../utilities/colors.dart';
import '../utilities/themes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            //!Welcome Message
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style: _textTheme.headline4,
                  ),
                  Text(
                    "to",
                    style: _textTheme.headline4,
                  ),
                  Text(
                    "Sharemore",
                    style: _textTheme.headline4,
                  ),
                ],
              ),
            ),
            //!Gap
            SizedBox(height: 20),
            //!Categories Container
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Read From",
                    style: _textTheme.headline6,
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Text("Business"),
                        SizedBox(width: 10),
                        Text("Categories"),
                        SizedBox(width: 10),
                        Text("Politics"),
                        SizedBox(width: 10),
                        Text("Music"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //!Gap
            SizedBox(height: 20),
            //!Recent Blogs
            Container(
              child: Column(
                children: [
                  Text(
                    "Recent Blogs",
                    style: _textTheme.headline6,
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        PostCard(),
                        SizedBox(height: 20),
                        PostCard()
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
