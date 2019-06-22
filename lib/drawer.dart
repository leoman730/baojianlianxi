import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:game/screen/activity_manager.dart';
import 'package:game/screen/section1.dart';
import 'package:game/screen/section2.dart';
import 'package:game/screen/section3.dart';
import 'screen/readme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image:DecorationImage(
                  image: ExactAssetImage('assets/images/sword.png'),
                  fit: BoxFit.cover,
                )
              ),
              child: Container(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "寶 劍\n練 習",
                    style: TextStyle(
                      fontFamily: "Kan Tan Bold",
                      fontSize: 35,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),),
                ),
              ),
            ),


            
            ListTile(
              title: Text('遊戲說明'),
              leading: Icon(MdiIcons.sword),
              trailing: Icon(Icons.arrow_forward_ios),

              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => ReadmeScreen()));
              },
            ),
            ListTile(
              title: Text('輪流題'),
              leading: Icon(MdiIcons.sword),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => Section1Screen()));
              },
            ),
            ListTile(
              title: Text('搶答題'),
              leading: Icon(MdiIcons.sword),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => Section2Screen()));
              },
            ),
            ListTile(
              title: Text('挑戰題'),
              leading: Icon(MdiIcons.sword),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => Section3Screen()));
              },
            ),
            ListTile(
              title: Text('设置'),
              leading: Icon(MdiIcons.settings),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute( builder: (context) => ActivityManager()));
              },
            ),
          ],
        ),
    );
  }
}