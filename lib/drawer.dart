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
              child: UserAccountsDrawerHeader(
//              accountName: Text("Ashish Rawat"),
//              accountEmail: Text("ashishrawat2911@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text( "Ray",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),


            
            ListTile(
              title: Text('遊戲說明'),
              trailing: Icon(Icons.arrow_forward_ios),

              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => ReadmeScreen()));
              },
            ),
            ListTile(
              title: Text('Section 1'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => Section1Screen()));
              },
            ),
            ListTile(
              title: Text('Section 2'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => Section2Screen()));
              },
            ),
            ListTile(
              title: Text('Section 3'),
              trailing: Icon(Icons.arrow_forward_ios),
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