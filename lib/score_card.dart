import 'package:flutter/material.dart';
import 'package:game/score_chart.dart';
import 'model/game_model.dart';


class ScoreCard extends StatefulWidget {
  final Team team;
  ScoreCard(this.team);

  @override
  ScoreCardState createState() => ScoreCardState();
}

class ScoreCardState extends State <ScoreCard> {

  @override
  Widget build(BuildContext context) {
   // print("I am rebuild");
    return Card(
        child: Row (
          children: <Widget>[
            Expanded (
              child: ScoreChart(widget.team),
              flex: 3,
            ),
            Expanded (
              flex: 3,
              child:
              ListTile(
//             leading: Icon(Icons.album),
                title: Text(widget.team.id),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
            ),
          ],
        )

    );
  }
}

