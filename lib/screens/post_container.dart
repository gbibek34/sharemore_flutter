import 'package:flutter/material.dart';
import 'package:sharemore/models/postModel.dart';
import 'package:sharemore/utilities/network_handler.dart';
import 'package:sharemore/widgets/post.dart';
import 'package:sharemore/widgets/sidebar.dart';
import 'package:sharemore/widgets/topbar.dart';

class PostContainer extends StatefulWidget {
  final post_id;
  final Function() parentRefresh;

  const PostContainer({
    Key? key,
    required this.post_id,
    required this.parentRefresh,
  }) : super(key: key);

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  NetworkHandler networkHandler = NetworkHandler();
  late Future<postModel> post;

  @override
  void initState() {
    super.initState();
    post = getPost();
  }

  Future<postModel> getPost() async {
    postModel temp_post = postModel();
    var res = await networkHandler.get("/post/${widget.post_id}");
    var postData = res["msg"];
    print(postData);
    temp_post = postModel(
      id: postData["_id"],
      title: postData["title"],
      description: postData["description"],
      image: postData["image"],
      username: postData["username"],
      category: postData["category"],
      createdAt: postData["createdAt"],
    );
    return Future.delayed(Duration.zero, () => temp_post);
  }

  refreshData() {
    widget.parentRefresh();
    setState(() {
      post = getPost();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: FutureBuilder<postModel>(
              future: post,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Post(
                    id: "${snapshot.data!.id!}",
                    title: "${snapshot.data!.title!}",
                    description: "${snapshot.data!.description!}",
                    category: "${snapshot.data!.category!}",
                    username: "${snapshot.data!.username!}",
                    createdAt: "${snapshot.data!.createdAt!}",
                    parentRefresh: refreshData,
                  );
                } else {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
