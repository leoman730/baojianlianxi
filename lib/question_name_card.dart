import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screen/question_screen.dart';
import 'package:game/model/game_model.dart';

class QuestionCard extends StatefulWidget {
  final Question question;

  QuestionCard(this.question);

  @override
  QuestionCardState createState() => QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {

  _showQuestion(Question question) {
    Navigator.push(context,
        MaterialPageRoute( builder: (context) => QuestionScreen(question)));
  }



  @override
  Widget build(BuildContext context) {
    // Todo: This card needs to look better.
    double _height = 65;
    double _width = MediaQuery.of(context).size.width;

    double elevation = 5;

    return ScopedModelDescendant(
      builder: (context, child, GameModel model) {
        return Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(90),

            onTap: () {

              model.setCardStatus(widget.question.id, true);
//              model.toggleActiveTeam();

              _showQuestion(widget.question);
            },
            child: Stack(
            children: <Widget>[
//            Container(
//              width: _width,
//              height: _height,
//              child: Image.network(
//                'https://placeimg.com/640/480/any',
//                fit: BoxFit.fill,
//              ),
//            ),
              Container(
                  height: _height,
                  child: Center(
                    child: Text(
                      widget.question.score.toString(),
                      style: TextStyle(
                        color: (model.getCardStatus(widget.question.id)) ? Colors.grey : Colors.green ,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
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
      },
    );
  }
}
