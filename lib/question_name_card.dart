import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screen/question_screen.dart';
import 'package:game/model/game_model.dart';
import 'dart:math';

class QuestionCard extends StatefulWidget {
  final Question question;

  QuestionCard(this.question);

  @override
  QuestionCardState createState() => QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {

  final _random = new Random();

  _showQuestion(Question question) {
    Navigator.push(context,
        MaterialPageRoute( builder: (context) => QuestionScreen(question)));
  }



  @override
  Widget build(BuildContext context) {
    // Todo: This card needs to look better.
    double _height = 65;
    double _width = MediaQuery.of(context).size.width;
    // yeah, 0 is also an integer.
    int randomNumber = 1 + _random.nextInt(26);
//    String imageUrl = 'assets/images/kids/'+widget.question.id.toString()+'-min.jpg';
    String imageUrl = 'assets/images/eden/optimized/'+widget.question.id.toString()+'.jpg';
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
              Container(
                width: _width,
                height: _height,
                child: Opacity(
                    opacity: (model.getCardStatus(widget.question.id)) ? 0.3 : 0.9 ,
                    child: Image.asset(imageUrl, fit: BoxFit.cover,)
                ),
              ),
//              // todo: how to construct this hero image
//            Hero(
//              tag: 'photo',
//            ),
              Container(
                  height: _height,
                  padding: EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      widget.question.score.toString(),
                      style: TextStyle(
                        color: (model.getCardStatus(widget.question.id)) ? Colors.grey : Colors.white ,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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
