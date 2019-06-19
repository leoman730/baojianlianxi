import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:game/score_board.dart';
import 'section1_question_board.dart';
//import 'package:flip_card/flip_card.dart';


class Section1Screen extends StatelessWidget {
//  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Section 1"),
      ),
      body:
        Column (
          children: <Widget>[
            Expanded(
              flex: 7,
              child:Section1QuestionBoard(),
            ),
            Expanded(
              flex: 3,
              child: ScoreBoard(),
            )
          ],
        ),
      drawer: DrawerWidget(),
    );
  }
}


