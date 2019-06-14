import 'package:flutter/material.dart';
import 'package:game/score_chart.dart';



class ScoreCard extends StatefulWidget {
  final String teamTitle;
  ScoreCard(this.teamTitle);

  @override
  ScoreCardState createState() => ScoreCardState();
}

class ScoreCardState extends State <ScoreCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row (
          children: <Widget>[
            Expanded (
              child: ScoreChart(),
              flex: 3,
            ),
            Expanded (
              flex: 3,
              child:
              ListTile(
//             leading: Icon(Icons.album),
                title: Text(widget.teamTitle),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
            ),
          ],
        )

    );
  }
}

