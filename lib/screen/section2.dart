import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:game/score_board.dart';
import 'section2_question_board.dart';

class Section2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Section 2"),
      ),
      body:
      Column (
        children: <Widget>[
          Expanded(
              flex: 7,
              child: Section2QuestionBoard()
          ),
          Expanded(
            flex: 3,
            child: ScoreBoard(),
          )
        ],
      ),
//      drawer: DrawerWidget(),
    );
  }
}



