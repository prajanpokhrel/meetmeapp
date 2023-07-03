import 'package:flutter/material.dart';

import '../utils/routes.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // var name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.loginRoute);
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
                    // Text(
                    //   "welcome $name",
                    //   // ignore: prefer_const_constructors
                    //   style: TextStyle(
                    //     // ignore: prefer_const_constructors
                    //     color: Color.fromARGB(255, 8, 8, 8),
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
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
                          ),
                          TextFormField(
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                                labelText: "Email",
                                // border: InputBorder.none,
                                hintText: 'Enter your email'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email it cannot  be empty';
                              }
                              return null;
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
                                return 'password cannot be empty';
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
                                        "Register",
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
                              Text("Already have an account "),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.loginRoute);
                                  },
                                  child: Text(
                                    'Login',
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
                          //   child: Text("Register"),
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
