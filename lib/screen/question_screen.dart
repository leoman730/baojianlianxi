import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:game/score_board.dart';
import 'package:flip_card/flip_card.dart';
import 'package:game/model/game_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'activity_manager.dart';

class QuestionScreen extends StatelessWidget {
  Question question;

  QuestionScreen(this.question) {
    // Update active score here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question: " +
            question.id +
            " score: " +
            question.score.toString()),
      ),
      body: ScopedModelDescendant(
          builder: (context, child, GameModel model) {

            // update active score here
            print('at question screen');
            model.setActiveScore(this.question.score.toDouble());

        return Column(
          children: <Widget>[
            Expanded(
                flex: 7,
                child: GestureDetector(
                  onHorizontalDragEnd: (DragEndDetails details) =>
                      _onHorizontalDrag(details, context),
                  onVerticalDragEnd: (DragEndDetails details) =>
                    _onVerticalDragEnd(details, context),
                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
//                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: _buildQuestionScreen(question),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF006666),
//                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: _buildQuestionScreen(question, withAnswer: true),
                    ),
                  ),
                )),
            Expanded(
              flex: 3,
              child: ScoreBoard(),
            )
          ],
        );
      }),
      drawer: DrawerWidget(),
    );
  }

  Widget _buildQuestionScreen(Question question, {bool withAnswer = false}) {
    List<Widget> content = [];

    if (question.image != null) {
      Widget image = Center(child: Builder(builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return new Image.asset(
          question.image,
          height: size.height * 0.3,
          fit: BoxFit.fill,
        );
      }));

      content.add(image);
    }

    Widget main_question = Center(
      child: Text(
        question.question,
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      ),
    );

    content.add(main_question);

    if (withAnswer == true) {
      Widget answer = Center(
        child: Text(
          question.answer,
          style: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      );

      content.add(answer);
    }

    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: content,
      ),
    );
  }

  void _onHorizontalDrag(DragEndDetails details, context) {
    if (details.primaryVelocity == 0)
      return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity.compareTo(0) == -1)
//      print('dragged from left');
      Navigator.pop(context);
    else
//      print('dragged from right');
      Navigator.pop(context);
  }


  void _onVerticalDragEnd(DragEndDetails details, context) {
    if (details.primaryVelocity == 0)
      return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity.compareTo(0) == -1) {
//      print('dragged from left');
//      Navigator.push(context,
//          MaterialPageRoute( builder: (context) => ActivityManager()));
//      Navigator.pop(context);
    }

    else {
      Navigator.push(context,
          MaterialPageRoute( builder: (context) => ActivityManager()));
    }
  }
}
