import 'package:flutter/material.dart';
import 'package:game/screen/section1.dart';
import 'package:game/screen/section2.dart';
import 'package:game/screen/section3.dart';
import 'screen/readme.dart';

class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('遊戲說明'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => ReadmeScreen()));
              },
            ),
            ListTile(
              title: Text('Section 1'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => Section1Screen()));
              },
            ),
            ListTile(
              title: Text('Section 2'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => Section2Screen()));
              },
            ),
            ListTile(
              title: Text('Section 3'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => Section3Screen()));
              },
            ),
          ],
        ),
    );
  }
}