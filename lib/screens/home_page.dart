import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "welcome to MeetMe App";
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(
        // ignore: prefer_const_constructors
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text("MeetMe"),
      ),
      body: Center(
        // ignore: prefer_const_constructors
        child: Column(children: [
          SizedBox(
            height: 20.0,
          ),
          Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
            width: 150,
          ),
          SizedBox(
            height: 20.0,
          ),
          Image.asset(
            "assets/images/girlimage.png",
            fit: BoxFit.cover,
            width: 330,
            height: 300,
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            child: Icon(
              Icons.close,
              color: Colors.red,
              size: 40,
            ),
            onTap: () {
              //action code when clicked
              print("The icon is clicked");
            },
          ),
        ]),
      ),
      drawer: myDrawer(),
    );
  }
}
