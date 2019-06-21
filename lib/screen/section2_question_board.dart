import 'package:flutter/material.dart';
import 'package:game/category.dart';
import 'package:game/model/game_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:game/question_name_card.dart';

class Section2QuestionBoard extends StatelessWidget {

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
//    print(model.questions2);
    List<Widget> items = [];

    model.questions2.forEach((questionSet) {
      print(model);
      items.add(
          new Expanded(
              child:
                ListView.builder(
                    itemCount: questionSet['questions'].length,
                    itemBuilder: (context, index) {
                    Question question = Question(questionSet['questions'][index]);
                    return QuestionCard(question);
                  }
                )
          )
      );
    });

    return items;

  }
}
