import 'package:flutter/material.dart';

import 'package:sharemore/widgets/sidebar.dart';
import 'package:sharemore/widgets/topbar.dart';
import 'package:sharemore/widgets/post_card.dart';
import 'package:sharemore/utilities/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: Sidebar(),
      appBar: PreferredSize(
        child: Topbar(),
        preferredSize: Size(double.infinity, 60),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              //todo:Welcome Message
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
              //todo:Gap
              SizedBox(height: 20),
              //todo:Categories Container
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
              //todo:Gap
              SizedBox(height: 20),
              //todo:Recent Blogs
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
      ),
    );
  }
}
