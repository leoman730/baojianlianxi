import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'score_card.dart';

class ScoreBoard extends StatefulWidget {

  @override
  ScoreBoardState createState() => ScoreBoardState();
}


class ScoreBoardState extends State {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column (
      children: <Widget>[
        Container(
          alignment: Alignment(-1.0, 0.0),
          padding: EdgeInsets.all(5.0),
          height: 50,
          width: size.width,
          decoration: new BoxDecoration(
            color: new Color(0xff4caf50),
            shape: BoxShape.rectangle,
          ),
          child:
          Text("分數", style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),),
        ),
        Container(
          child: Row (
            children: <Widget>[
              Expanded (
                child: ScoreCard("Team 1"),
              ),
              Expanded (
                child: ScoreCard("Team 2"),
              )
            ],
          ),
        )

      ],
    );
  }
}