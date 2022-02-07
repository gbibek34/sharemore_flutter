import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:sharemore/models/postModel.dart';
import 'package:sharemore/utilities/network_handler.dart';
import 'package:sharemore/widgets/sidebar.dart';
import 'package:sharemore/widgets/topbar.dart';
import 'package:sharemore/widgets/post_card.dart';
import 'package:sharemore/utilities/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NetworkHandler networkHandler = NetworkHandler();

  late Future<List<postModel>> posts;
  bool circular = true;
  @override
  void initState() {
    super.initState();
    posts = getPosts();
  }

  Future<List<postModel>> getPosts() async {
    List<postModel> temp_list = <postModel>[];
    var res = await networkHandler.get("/post/");
    var postData = res["msg"];
    for (int i = 0; i < res["msg"].length; i++) {
      temp_list.add(postModel(
        id: postData[i]["_id"],
        title: postData[i]["title"],
        description: postData[i]["description"],
        image: postData[i]["image"],
        username: postData[i]["username"],
        category: postData[i]["category"],
        createdAt: postData[i]["createdAt"],
      ));
    }
    return Future.delayed(Duration.zero, () => temp_list);
  }

  dataRefresh() {
    setState(() {
      posts = getPosts();
    });
  }

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
                          FutureBuilder<List<postModel>>(
                              future: posts,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return PostCard(
                                            post_id: snapshot.data![index].id!,
                                            category:
                                                snapshot.data![index].category!,
                                            title: snapshot.data![index].title!,
                                            description: snapshot
                                                .data![index].description!,
                                            parentRefresh: dataRefresh,
                                          );
                                        }),
                                  );
                                } else {
                                  return Container(
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                }
                              }),
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
