import 'package:flutter/material.dart';
import 'package:sharemore/utilities/userfetch.dart';
import 'package:sharemore/widgets/post_editing.dart';
import 'package:intl/intl.dart';

class Post extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String category;
  final String username;
  final String createdAt;
  final Function() parentRefresh;

  const Post({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.username,
    required this.createdAt,
    required this.parentRefresh,
  }) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var date;
  var user;
  userFetch() async {
    user = await getUser();
    return widget.username == user.username;
  }

  @override
  void initState() {
    super.initState();
    print(userFetch());
    var temp_date = DateTime.now();
    date = DateFormat.yMd().format(temp_date);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage("assets/images/dummy.jpg"),
                width: double.infinity,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.title}",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //todo:only for user whom the post belongs to
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => PostEdit(
                                    post_id: widget.id,
                                    title: widget.title,
                                    description: widget.description,
                                    category: widget.category,
                                    refreshParent: widget.parentRefresh,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text("Confirm Delete?"),
                                  content: Text(
                                      "Are you sure you want to delete this post?"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context, "Confirm");
                                      },
                                      child: Text("Confirm"),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red,
                                          onPrimary: Colors.white),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context, "Cancel");
                                      },
                                      child: Text("Cancel"),
                                    )
                                  ],
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By: " + "${widget.username}",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${widget.category}",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        backgroundColor: Colors.teal,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50),
                Container(
                  child: Text(
                    "${widget.description}",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
