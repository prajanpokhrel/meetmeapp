import 'package:flutter/material.dart';

import '../utils/routes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_constructors
        home: Material(
            color: Colors.white,
            // ignore: prefer_const_constructors
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.cover,
                      width: 200,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 16.0,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "welcome $name",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        // ignore: prefer_const_constructors
                        color: Color.fromARGB(255, 8, 8, 8),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                      child: Column(
                        children: [
                          TextFormField(
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                                labelText: "username",
                                // border: InputBorder.none,
                                hintText: 'enter a user name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },

                            onChanged: (value) {
                              name = value;
                              setState(() {});
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                                hintText: 'enter a password',
                                labelText: "password"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'password cannot be empty ';
                              } else if (value == null || value.length < 6) {
                                return "Please enter password more than 6 characters";
                              }
                              return null;
                            },
                            // border: InputBorder.none,
                          ),

                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 16.0,
                          ),

                          Material(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () => moveToHome(context),
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                width: changeButton ? 50 : 100,
                                height: 50,
                                alignment: Alignment.center,
                                child: changeButton
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                // decoration: BoxDecoration(
                                //     color: Colors.deepPurple,
                                //     borderRadius: BorderRadius.circular(
                                //         changeButton ? 50 : 8)),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text("Don't have an account "),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.registerRoute);
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ))
                            ],
                          )

                          // ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                          //   },
                          //   child: Text("login"),
                          //   style:
                          //       TextButton.styleFrom(minimumSize: Size(100, 40)),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
