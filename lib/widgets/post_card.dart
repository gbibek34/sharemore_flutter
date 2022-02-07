import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String category;
  final String title;
  final String description;

  const PostCard({
    Key? key,
    required this.category,
    required this.title,
    required this.description,
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
        onTap: () {},
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
