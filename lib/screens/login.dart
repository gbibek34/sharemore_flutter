import 'package:flutter/material.dart';
import 'package:sharemore/screens/home.dart';
import 'package:sharemore/screens/register.dart';
import 'package:sharemore/utilities/network_handler.dart';
import 'package:sharemore/utilities/token_storage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordvis = true;
  final _validatorkey = GlobalKey<FormState>();

  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool uinvalid = false;
  bool pinvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: CircleAvatar(
                      radius: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        child: Image(
                          image: AssetImage("assets/images/login.png"),
                          height: 320,
                          width: 320,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Welcome to",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Sharemore",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                        passwordField(),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton.icon(
                          onPressed: () async {
                            setState(() {
                              uinvalid = false;
                              pinvalid = false;
                            });
                            if (_validatorkey.currentState!.validate()) {
                              Map<String, String> data = {
                                "username": _usernameController.text,
                                "password": _passwordController.text
                              };

                              var res = await networkHandler.post(
                                  "/user/login", data);

                              if (res["success"] == true) {
                                Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                                assignToken(res["token"]);
                              } else if (res["msg"] == "Invalid Password") {
                                setState(() {
                                  pinvalid = true;
                                });
                                _validatorkey.currentState!.validate();
                              } else if (res["msg"] == "Invalid Username") {
                                setState(() {
                                  uinvalid = true;
                                });
                                _validatorkey.currentState!.validate();
                              }
                            }
                          },
                          icon: Icon(Icons.login),
                          label: Text("Login"),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dont have an account yet?"),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ),
                                );
                              },
                              child: Text(
                                "Create One",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
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
            if (uinvalid == true) return "Username Invalid";

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

  Widget passwordField() {
    return Column(
      children: [
        TextFormField(
          controller: _passwordController,
          validator: (value) {
            if (value!.isEmpty) return "Password can't be empty";
            if (pinvalid == true) return "Password Invalid";
            return null;
          },
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
