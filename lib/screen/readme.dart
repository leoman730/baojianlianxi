import 'package:flutter/material.dart';
import 'package:game/drawer.dart';


class ReadmeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("遊戲說明"),
        automaticallyImplyLeading: true,
      ),
      body: Stack (
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/images/splash.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Text(
              "Some text here",
              style: TextStyle (
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: Colors.white
              ),
            ),
          )
        ],
      ),
      drawer: DrawerWidget(),

    );
  }
}
