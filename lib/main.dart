import 'package:app/screens/home_page.dart';
import 'package:app/screens/login_page.dart';
import 'package:app/screens/register_page.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  get routes => null;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors

      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.red,
        // fontFamily: GoogleFonts.lato().fontFamily,
      ), //for light theme
      //for darkmode
      darkTheme: ThemeData(brightness: Brightness.dark),
      // initialRoute: "/home",
      routes: {
        // ignore: prefer_const_constructors
        "/": (context) => Register(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.registerRoute: (context) => Register()
      },
    );
  }
}
