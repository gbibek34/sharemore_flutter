import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sharemore/utilities/colors.dart';
import 'package:sharemore/utilities/network_handler.dart';

class ProfileEdit extends StatefulWidget {
  final String user_id;
  final String username;
  final String email;
  final Function() refreshParent;

  const ProfileEdit({
    Key? key,
    required this.user_id,
    required this.username,
    required this.email,
    required this.refreshParent,
  }) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool passwordvis = true;
  final _validatorkey = GlobalKey<FormState>();

  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool error = false;

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.username;
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: SingleChildScrollView(
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
                        "Editing",
                        style: _textTheme.headline6,
                      ),
                      Text(
                        "${widget.username}",
                        style: _textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _validatorkey,
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 30,
                        left: 30,
                        right: 30,
                      ),
                      child: Column(
                        children: [
                          usernameField(),
                          SizedBox(
                            height: 20,
                          ),
                          emailField(),
                          SizedBox(
                            height: 20,
                          ),
                          passwordField(),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton.icon(
                            onPressed: () async {
                              setState(() {
                                error = false;
                              });
                              if (_validatorkey.currentState!.validate()) {
                                Map<String, String> data = {
                                  "username": _usernameController.text,
                                  "email": _emailController.text,
                                  "pasword": _passwordController.text
                                };

                                var res = await networkHandler.put(
                                    "/user/update/${widget.user_id}", data);
                                if (res["success"] == true) {
                                  widget.refreshParent();
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    error = true;
                                  });
                                  _validatorkey.currentState!.validate();
                                }
                              }
                            },
                            icon: Icon(Icons.edit_outlined),
                            label: Text("Edit Profile"),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.redAccent),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return Column(
      children: [
        TextFormField(
          controller: _usernameController,
          validator: (value) {
            if (value!.isEmpty) return "Username can't be empty";
            if (error == true) return "Cannot update user!";

            return null;
          },
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Username',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget emailField() {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          validator: (value) {
            if (value!.isEmpty) return "Email can't be empty";
            if (!value.contains("@")) return "Invalid Email";
            return null;
          },
          decoration: InputDecoration(
            labelText: 'E-mail',
            hintText: 'E-mail',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget passwordField() {
    return Column(
      children: [
        TextFormField(
          controller: _passwordController,
          // validator: (value) {
          //   if (value!.isEmpty) return "Password can't be empty";
          //   if (value.length < 6) return "Passwords should least be 6 letters";
          //   return null;
          // },
          obscureText: passwordvis,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(passwordvis ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  passwordvis = !passwordvis;
                });
              },
            ),
            labelText: 'Password',
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
