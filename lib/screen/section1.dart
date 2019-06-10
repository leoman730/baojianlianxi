import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:game/category.dart';

class Section1Screen extends StatelessWidget {

//  Map _questions = new Map();

  var _questions = {
    '新約聖經題目 1': ['10 分', '20 分','30 分','40 分','50 分'],
    "新約聖經題目 2": ['10 分', '20 分','30 分','40 分','50 分'],
    '團契教會題': ['10 分', '20 分','30 分','40 分','50 分'],
    '常識題': ['10 分', '20 分','30 分','40 分','50 分'],
    '猜猜我是誰': ['10 分', '20 分','30 分','40 分','50 分'],
    '飲食男女': ['10 分', '20 分','30 分','40 分','50 分'],
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

//    final categories = [[],[],[]];

    return Scaffold(
      appBar: AppBar(
        title: Text("Section 1"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
              child: Opacity(
            opacity: 0.3,
            child: new Image.asset(
              'assets/images/splash.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          )),
          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: _buildItemList(),
          )
        ],
      ),
      drawer: DrawerWidget(),
    );
  }

  List<Widget> _buildItemList() {
    List<Widget> items = [];
    _questions.forEach((key, value) {
      items.add(
          new Expanded(
            child:
              CategoryWidget(key, value)
          )
      );
    });

    return items;

  }

}
