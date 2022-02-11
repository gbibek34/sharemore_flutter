import 'package:flutter/material.dart';
import 'package:sharemore/screens/post_container.dart';

class PostCard extends StatefulWidget {
  final String post_id;
  final String category;
  final String title;
  final String description;
  final Function() parentRefresh;

  const PostCard({
    Key? key,
    required this.post_id,
    required this.category,
    required this.title,
    required this.description,
    required this.parentRefresh,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => PostContainer(
                post_id: widget.post_id,
                parentRefresh: widget.parentRefresh,
              ),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Ink.image(
                  height: 200,
                  image: AssetImage("assets/images/dummy.jpg"),
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.category}"),
                  Text(
                    "${widget.title}",
                    style: _textTheme.headline5,
                  ),
                  Text(
                    "${widget.description}",
                    style: TextStyle(fontSize: 18),
                    maxLines: 2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
