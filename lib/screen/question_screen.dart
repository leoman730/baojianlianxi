import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:game/score_board.dart';
import 'package:flip_card/flip_card.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 7,
              child: GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) =>
                    _onHorizontalDrag(details, context),
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: _buildQuestionScreen(),
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF006666),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: _buildQuestionScreen(withAnswer: true),
                  ),
                ),
              )),
          Expanded(
            flex: 3,
            child: ScoreBoard(),
          )
        ],
      ),
      drawer: DrawerWidget(),
    );
  }

  Widget _buildQuestionScreen({bool withAnswer = false}) {
    const question = {
      "image": 'assets/images/splash.png',
      "main_question": "what is in the image?",
      "answer": "a sword",
    };

    List<Widget> content = [];

    if (question.containsKey("image")) {
      Widget image = Center(child: Builder(builder: (BuildContext context) {
        Size size = MediaQuery
            .of(context)
            .size;
        return new Image.asset(
          question['image'],
          height: size.height * 0.3,
          fit: BoxFit.fill,
        );
      }));

      content.add(image);
    }

    Widget main_question = Center(
      child: Text(
        question['main_question'],
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      ),
    );

    content.add(main_question);


    if (withAnswer == true) {
      Widget answer = Center(
        child: Text(
          question['answer'],
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.green
          ),
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

}
