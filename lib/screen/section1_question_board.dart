import 'package:flutter/material.dart';
import 'package:game/category.dart';
import 'package:game/model/game_model.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:flip_card/flip_card.dart';


class Section1QuestionBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Center(
            child: Opacity(
              opacity: 0.4,
              child: new Image.asset(
                'assets/images/bg1.jpg',
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
