import 'package:flutter/material.dart';

import 'package:sharemore/screens/post_list.dart';

import 'package:sharemore/utilities/colors.dart';
import 'package:sharemore/utilities/network_handler.dart';
import 'package:sharemore/utilities/notification.dart';

import 'package:sharemore/widgets/sidebar.dart';
import 'package:sharemore/widgets/topbar.dart';

class PostWrite extends StatefulWidget {
  const PostWrite({Key? key}) : super(key: key);

  @override
  State<PostWrite> createState() => _PostWriteState();
}

class _PostWriteState extends State<PostWrite> {
  NetworkHandler networkHandler = NetworkHandler();

  final _validatorkey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String categoryValue = "Random";

  bool existing = false;

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
                      "Create a post",
                      style: _textTheme.headline4,
                    )
                  ],
                ),
              ),
              Form(
                key: _validatorkey,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    children: [
                      titleField(),
                      SizedBox(
                        height: 20,
                      ),
                      descriptionField(),
                      SizedBox(
                        height: 20,
                      ),
                      categoryField(),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          setState(() {
                            existing = false;
                          });
                          if (_validatorkey.currentState!.validate()) {
                            Map<String, String> data = {
                              "title": _titleController.text,
                              "description": _descriptionController.text,
                              "category": categoryValue
                            };

                            var res = await networkHandler
                                .get("/post/existing/${_titleController.text}");

                            if (res["success"] == true) {
                              networkHandler.post("/post/create", data);
                              createPostCreateNotification();
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => PostList(),
                                ),
                              );
                            } else {
                              setState(() {
                                existing = true;
                              });
                              _validatorkey.currentState!.validate();
                            }
                          }
                        },
                        icon: Icon(Icons.publish),
                        label: Text("Publish"),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget titleField() {
    return Column(
      children: [
        TextFormField(
          controller: _titleController,
          validator: (value) {
            if (value!.isEmpty) return "Title can't be empty";
            if (existing == true) return "Title already exists";

            return null;
          },
          decoration: InputDecoration(
            labelText: 'Title',
            hintText: 'Title',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget descriptionField() {
    return Column(
      children: [
        TextFormField(
          maxLines: 5,
          controller: _descriptionController,
          validator: (value) {
            if (value!.isEmpty) return "Description can't be empty";

            return null;
          },
          decoration: InputDecoration(
            labelText: 'Description',
            hintText: 'Description',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  var _categories = ["Random", "Music", "Technology", "Programming"];

  Widget categoryField() {
    return Column(
      children: [
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                labelText: 'Category',
                hintText: 'Category',
                border: OutlineInputBorder(),
              ),
              isEmpty: categoryValue == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: categoryValue,
                  isDense: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      categoryValue = newValue!;
                      state.didChange(newValue);
                    });
                  },
                  items:
                      _categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
