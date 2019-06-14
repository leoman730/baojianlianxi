import 'package:flutter/material.dart';
import 'package:game/category.dart';

class Section1QuestionBoard extends StatelessWidget {
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

    return Stack(
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
          children: _buildQuestionList(),
        )
      ],
    );
  }

  List<Widget> _buildQuestionList() {
    List<Widget> items = [];
    _questions.forEach((key, value) {
      items.add(
          new Expanded(
              child:
              CategoryColumnWidget(key, value)
          )
      );
    });

    return items;

  }
}
