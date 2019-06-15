import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'score_card.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/game_model.dart';

class ScoreBoard extends StatefulWidget {
  @override
  ScoreBoardState createState() => ScoreBoardState();
}

class ScoreBoardState extends State {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

//    return ScopedModel(
//      model: new TeamModel(),
//      child:
//        Column (
//      children: <Widget>[
//        Container(
//          alignment: Alignment(-1.0, 0.0),
//          padding: EdgeInsets.all(5.0),
//          height: 50,
//          width: size.width,
//          decoration: new BoxDecoration(
//            color: new Color(0xff4caf50),
//            shape: BoxShape.rectangle,
//          ),
//          child:
//          Text("分數", style: TextStyle(
//              color: Colors.white,
//              fontWeight: FontWeight.bold,
//              fontSize: 18
//          ),),
//        ),
//        Container(
//          child: Row (
//            children: <Widget>[
//              Expanded (
//                child: Builder(
//                 builder: (context) {
//                   final team =
//                   ScopedModel.of<TeamModel>(context, rebuildOnChange: true);
//                   return ScoreCard(team);
//                  }
//                ),
//              ),
//              Expanded (
//                child: Builder(
//                    builder: (context) {
//                      final team =
//                      ScopedModel.of<TeamModel>(context, rebuildOnChange: true);
//                      return ScoreCard(team);
//                    }
//                ),
//              )
//            ],
//          ),
//        )
//
//      ],
//    )
//
//
//    );
    return Column(
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
          child: Text(
            "分數",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ScopedModelDescendant<GameModel>(
                  builder: (context, child, model) {
                    return ScoreCard(model.teams[0]);
                  },
                ),
              ),
              Expanded(
                child: ScopedModelDescendant<GameModel>(
                  builder: (context, child, model) {
                    return ScoreCard(model.teams[1]);
                  },
                ),
              ),
//
//    ScopedModel(
//      model: new GameModel(),
//              child:
//              Expanded (
//                child: Builder(
//                 builder: (context) {
//                   final team =
//                   ScopedModel.of<GameModel>(context, rebuildOnChange: true);
//                   return ScoreCard(team);
//                  }
//                ),
//              ),
//    ),
//
//              ScopedModel(
//                model: new GameModel(),
//                child:
//                Expanded (
//                  child: Builder(
//                      builder: (context) {
//                        final team =
//                        ScopedModel.of<GameModel>(context, rebuildOnChange: true);
//                        return ScoreCard(team);
//                      }
//                  ),
//                ),
//              ),
//              Expanded (
//                child: Builder(
//                    builder: (context) {
//                      final team =
//                      ScopedModel.of<TeamModel>(context, rebuildOnChange: true);
//                      return ScoreCard(team);
//                    }
//                ),
//              )
            ],
          ),
        )
      ],
    );
  }
}
