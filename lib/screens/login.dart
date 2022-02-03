import 'package:flutter/material.dart';
import 'package:sharemore/screens/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                child: Container(
                  padding: EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        // controller: fnamecontroller,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Username',
                          border: OutlineInputBorder(),
                          // errorText: fnamevalidate ? "Field cannot be empty" : null,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        // controller: fnamecontroller,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                          // errorText: fnamevalidate ? "Field cannot be empty" : null,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
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
                                  builder: (context) => Home(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
