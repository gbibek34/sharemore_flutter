import 'package:flutter/material.dart';
import 'package:sharemore/screens/home.dart';
import 'package:sharemore/screens/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passwordvis = true;
  final _validatorkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: CircleAvatar(
                        radius: 120,
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
                          emailField(),
                          SizedBox(
                            height: 20,
                          ),
                          passwordField(),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              if (_validatorkey.currentState!.validate()) {
                                //Validated
                              }
                            },
                            icon: Icon(Icons.edit_outlined),
                            label: Text("Register"),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?"),
                              SizedBox(width: 5),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Login",
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
      ),
    );
  }

  Widget usernameField() {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) return "Username can't be empty";
            // usename unique is not
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
          validator: (value) {
            if (value!.isEmpty) return "Email can't be empty";
            if (!value.contains("@")) return "Invalid Email";
            // email unique is not
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
          validator: (value) {
            if (value!.isEmpty) return "Password can't be empty";
            if (value.length < 6) return "Passwords should least be 6 letters";
            // usename unique is not
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