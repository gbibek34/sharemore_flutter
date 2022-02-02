import 'package:flutter/material.dart';

import 'package:sharemore/utilities/colors.dart';
import 'package:sharemore/widgets/post_card.dart';
import 'package:sharemore/widgets/sidebar.dart';
import 'package:sharemore/widgets/topbar.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: Sidebar(),
      appBar: PreferredSize(
        child: Topbar(),
        preferredSize: Size(double.infinity, 60),
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
                    "My Posts",
                    style: _textTheme.headline4,
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
