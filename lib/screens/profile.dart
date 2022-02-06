import 'package:flutter/material.dart';
import 'package:sharemore/models/userModel.dart';
import 'package:sharemore/utilities/colors.dart';
import 'package:sharemore/utilities/network_handler.dart';
import 'package:sharemore/widgets/sidebar.dart';
import 'package:sharemore/widgets/topbar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  NetworkHandler networkHandler = NetworkHandler();
  late Future<userModel> user;

  @override
  void initState() {
    super.initState();
    user = getUser();
  }

  Future<userModel> getUser() async {
    userModel temp_user = userModel();
    var res = await networkHandler.get("/user/get");
    temp_user = userModel(
      username: res["msg"]["username"],
      email: res["msg"]["email"],
      profile_picture: res["msg"]["profile_picture"],
      createdAt: res["msg"]["createdAt"],
    );
    return Future.delayed(Duration.zero, () => temp_user);
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
            child: Column(
              children: [
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
                        "My Profile",
                        style: _textTheme.headline4,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: FutureBuilder<userModel>(
                      future: user,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  child: Image(
                                      image:
                                          AssetImage("assets/images/user.jpg")),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "${snapshot.data!.username}",
                                style: _textTheme.headline5,
                              ),
                              SizedBox(height: 5),
                              Text("${snapshot.data!.email}"),
                              SizedBox(height: 20),
                              TextButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text("Edit Profile"),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.redAccent),
                                ),
                                onPressed: () {},
                                child: Text("Delete Profile"),
                              ),
                            ],
                          );
                        } else {
                          return Container(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
