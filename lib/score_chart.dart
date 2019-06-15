import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:game/model/game_model.dart';

class ScoreChart extends StatefulWidget {
  final Team team;

  ScoreChart(this.team);

  @override
  ScoreChartState createState() => ScoreChartState();
}

class ScoreChartState extends State<ScoreChart> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  final _chartSize = const Size(80.0, 80.0);
  double value = 0.0;
  Color labelColor = Colors.blue[200];

  List<CircularStackEntry> _generateChartData(double value) {
    Color dialColor = Colors.blue[200];
    if (value < 0) {
      dialColor = Colors.red[200];
    } else if (value < 50) {
      dialColor = Colors.yellow[200];
    }
    labelColor = dialColor;

    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            value,
            dialColor,
            rankKey: 'percentage',
          )
        ],
        rankKey: 'percentage',
      ),
    ];

    if (value > 100) {
      labelColor = Colors.green[200];

      data.add(new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            value - 100,
            Colors.green[200],
            rankKey: 'percentage',
          ),
        ],
        rankKey: 'percentage2',
      ));
    }

    return data;
  }

  void _increment({double value = 10}) {
    widget.team.increment(value);

    setState(() {
      List<CircularStackEntry> data = _generateChartData(widget.team.score);
      _chartKey.currentState.updateData(data);
    });
  }

  void _decrement({double value = 10}) {
    widget.team.decrement(value);
    setState(() {
      List<CircularStackEntry> data = _generateChartData(widget.team.score);
      _chartKey.currentState.updateData(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .title
        .merge(new TextStyle(color: labelColor));

    value = widget.team.score;

    return new Column(
      children: <Widget>[
        new Container(
          child: new AnimatedCircularChart(
            key: _chartKey,
            size: _chartSize,
            initialChartData: _generateChartData(value),
            chartType: CircularChartType.Radial,
            edgeStyle: SegmentEdgeStyle.round,
            percentageValues: true,
            holeLabel: value.toInt().toString(),
            labelStyle: _labelStyle,
          ),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new RaisedButton(
              onPressed: _decrement,
              child: const Icon(Icons.remove),
              shape: const CircleBorder(),
              color: Colors.red[200],
              textColor: Colors.white,
            ),
            new RaisedButton(
              onPressed: _increment,
              child: const Icon(Icons.add),
              shape: const CircleBorder(),
              color: Colors.blue[200],
              textColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
