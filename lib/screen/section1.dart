import 'package:flutter/material.dart';
import 'package:game/drawer.dart';
import 'package:game/score_board.dart';
import 'package:game/screen/activity_manager.dart';
import 'section1_question_board.dart';
//import 'package:flip_card/flip_card.dart';


class Section1Screen extends StatelessWidget {
//  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {

    return GestureDetector (
      onVerticalDragEnd: (DragEndDetails details) =>
          _onVerticalDragEnd(details, context),
      child: Scaffold(
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
      ),
    );
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


