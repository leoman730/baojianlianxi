import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:game/score_board.dart';
import 'package:flip_card/flip_card.dart';
import 'package:game/model/game_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'activity_manager.dart';



class QuestionScreen extends StatefulWidget {
  final Question question;

  QuestionScreen(this.question) {
    // Update active score here
  }

  @override
  QuestionScreenState createState() => QuestionScreenState();
}



class QuestionScreenState extends State<QuestionScreen> {
  GameModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question: " +
            widget.question.id +
            " score: " +
            widget.question.score.toString()),
      ),
      body: ScopedModelDescendant(
          builder: (context, child, GameModel model) {

            // update active score here
            model.setActiveScore(widget.question.score.toDouble());

            this.model = model;

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
                      child: _buildQuestionScreen(widget.question),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF006666),
//                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: _buildQuestionScreen(widget.question, withAnswer: true),
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
    List<Widget> main = [];

    if (question.image != null) {
      Widget image = Center(
          child: Builder(builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return new Image.asset(
          question.image,
          height: size.height * 0.3,
          fit: BoxFit.fill,
        );
      }));

      main.add(image);
    }

    Widget main_question = Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(
        question.question,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );

//    main.add(main_question);

    if (withAnswer == true) {
      Widget content = Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          main_question,
          Text(
            question.answer,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ],
      );



//      Widget answer = Center(
//        child: Text(
//          question.answer,
//          style: TextStyle(
//              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.green),
//        ),
//      );

      main.add(content);
    } else {
      main.add(main_question);
    }

    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Row(
        children: main,
      ),
    );
  }

  void _onHorizontalDrag(DragEndDetails details, context) {
    if (details.primaryVelocity == 0)
      return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity.compareTo(0) == -1) {
      Navigator.pop(context);
      this.model.toggleActiveTeam();
    }
    else {
      Navigator.pop(context);
      this.model.toggleActiveTeam();
    }
  }


  void _onVerticalDragEnd(DragEndDetails details, context) {
    if (details.primaryVelocity == 0)
      return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity.compareTo(0) == -1) {
    }

    else {
      Navigator.push(context,
          MaterialPageRoute( builder: (context) => ActivityManager()));
    }
  }
}
