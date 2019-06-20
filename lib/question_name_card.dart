import 'package:flutter/material.dart';
import 'screen/question_screen.dart';
import 'package:game/model/game_model.dart';

class QuestionCard extends StatefulWidget {
  final Question question;

  QuestionCard(this.question);

  @override
  QuestionCardState createState() => QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  bool has_opened = false;

  _showQuestion(Question question) {
    print("Before show question: " + question.toString());
    Navigator.push(context,
        MaterialPageRoute( builder: (context) => QuestionScreen(question)));
  }



  @override
  Widget build(BuildContext context) {
    // Todo: This card needs to look better.
    double _height = 50;
    double _width = MediaQuery.of(context).size.width;

    double elevation = 30;

    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(90),

          onTap: () {
            _showQuestion(widget.question);
          },
          child: Stack(
          children: <Widget>[
            Container(
              width: _width,
              height: _height,
              child: Image.network(
                'https://placeimg.com/640/480/any',
                fit: BoxFit.fill,
              ),
            ),
            Container(
                height: _height,
                child: Center(
                  child: Text(
                    widget.question.score.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )),
          ],
        ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: elevation,
        margin: EdgeInsets.all(10),
      );
  }
}
