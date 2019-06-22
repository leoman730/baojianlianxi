import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:game/screen/section1.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReadmeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width * 0.8;
    double height = size.height * 0.65;

    String html = '<b>寶劍練習規則</b><p>所有人分成兩個小組競賽</p>';


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
            child: Opacity(
              opacity: 0.8,
              child: Container(
                width: width,
                height: height,
                margin: EdgeInsets.only(top: 40.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: width,
              height: height,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white
                    ),
                    children: <TextSpan> [
                      TextSpan( text: "寶劍練習規則", style: TextStyle(fontSize: 30),),
                      TextSpan( text: "\n\n所有人分成兩個小組競賽", style: TextStyle(fontSize: 20),),
                      TextSpan( text: "\n\n1. 輪流題", style: TextStyle(fontSize: 20),),
                      TextSpan( text: "\n\n  - 每一組輪流抽取題目作答，答對加分，答錯扣分", style: TextStyle(fontSize: 15),),
                      TextSpan( text: "\n\n2. 搶答題", style: TextStyle(fontSize: 20),),
                      TextSpan( text: "\n\n  - 搶答題總共15題，每題30分，答對加30分，答錯扣30分", style: TextStyle(fontSize: 15),),
                      TextSpan( text: "\n  - 主持人讀完題，宣布“開始”之後，各組代表方可拍桌子搶答，在主持人宣布“開始”之前，桌子聲響起視為犯規，扣30分", style: TextStyle(fontSize: 15),),
                      TextSpan( text: "\n  - 在獲得答題權後，必須在10秒中開始回答，在30秒內完成答題，否則視同答錯扣分", style: TextStyle(fontSize: 15),),
                      TextSpan( text: "\n\n3. 挑戰題", style: TextStyle(fontSize: 20),),
                      TextSpan( text: "\n\n  - 總共只有一道題，在主持人宣布問題之後，每個小組將答案寫在紙上作答 ", style: TextStyle(fontSize: 15),),
                      TextSpan( text: "\n  - 分數不定，由小組自行決定要放多少分，答對了加相應的分數，答錯了扣相應的分數，分數不可低於100分！", style: TextStyle(fontSize: 15),),
                    ]
                  ),
                ),
              ),
            ),
          ),
          Container(
//            width: width,
//            height: height,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: OutlineButton.icon(
                borderSide: BorderSide(
                  color: Colors.white, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 3, //width of the border
                ),
                icon: Icon(MdiIcons.controllerClassicOutline, color: Colors.white, size: 40,), //`Icon` to display
                label: Text('開始遊戲', style: TextStyle(fontSize: 25, color: Colors.white),), //`Text` to display
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Section1Screen()));
                },
              ),
            ),
            margin:EdgeInsets.only(bottom: 15),
          )
        ],
      ),
      drawer: DrawerWidget(),

    );
  }
}
