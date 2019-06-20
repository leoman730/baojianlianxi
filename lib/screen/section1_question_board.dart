import 'package:flutter/material.dart';
import 'package:game/category.dart';
import 'package:game/model/game_model.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:flip_card/flip_card.dart';


class Section1QuestionBoard extends StatelessWidget {
//  var _questions = {
//    '新約聖經題目 1': ['10 分', '20 分','30 分','40 分','50 分'],
//    "新約聖經題目 2": ['10 分', '20 分','30 分','40 分','50 分'],
//    '團契教會題': ['10 分', '20 分','30 分','40 分','50 分'],
//    '常識題': ['10 分', '20 分','30 分','40 分','50 分'],
//    '猜猜我是誰': ['10 分', '20 分','30 分','40 分','50 分'],
//    '飲食男女': ['10 分', '20 分','30 分','40 分','50 分'],
//  };

//  final GlobalKey<FlipCardState> cardKey;

//  Section1QuestionBoard({Key key, this.cardKey}) : super(key: key);
  // State
  List game_state = [];

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
        ScopedModelDescendant <GameModel>(
          builder: (context, child, model) {
            return Center(
              child: Row(
                children: _buildQuestionList(model),
              ),
            );
          },
        )
      ],
    );
  }

  List<Widget> _buildQuestionList(GameModel model) {
//    print(model);
    List<Widget> items = [];

    model.questions.forEach((questionSet) {
      items.add(
          new Expanded(
              child:
              CategoryColumnWidget(questionSet)
          )
      );
    });

    return items;

  }
}
