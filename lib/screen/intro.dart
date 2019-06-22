import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:game/screen/readme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double width = size.width * 0.8;
    double height = size.height * 0.65;

    return
      Stack(
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
            child: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 80),
              child: FlatButton.icon(
                color: Colors.blueAccent,
                icon: Icon(MdiIcons.christianityOutline, color: Colors.white, size: 30,), //`Icon` to display
                label: Text('開始遊戲', style: TextStyle(fontSize: 30, color: Colors.white),), //`Text` to display
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReadmeScreen()));
                },
              ),
            ),)

        ],
      );
  }
}
