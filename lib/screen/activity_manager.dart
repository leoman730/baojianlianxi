import 'package:flutter/material.dart';
import 'package:game/model/game_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ActivityManager extends StatefulWidget {
  @override
  ActivityManagerState createState() => ActivityManagerState();
}

class ActivityManagerState extends State<ActivityManager> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (DragEndDetails details) =>
          _onVerticalDragEnd(details, context),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Activity Manager"),
          centerTitle: true,
        ),
        body: Container(child:
            ScopedModelDescendant<GameModel>(builder: (context, child, model) {
          return Container(child: Center(child: ActivitySettingForm(model)));
        })),
      ),
    );
  }

  void _onVerticalDragEnd(DragEndDetails details, context) {
    if (details.primaryVelocity == 0)
      return; // user have just tapped on screen (no dragging)
    if (details.primaryVelocity.compareTo(0) == -1) {
      Navigator.pop(context);
    }
  }
}

class ActivitySettingForm extends StatefulWidget {
  final GameModel model;

  ActivitySettingForm(this.model) {
//    print(model.score);
  }

  @override
  ActivitySettingFormState createState() => ActivitySettingFormState();
}

class ActivitySettingFormState extends State<ActivitySettingForm> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _toggleActiveTeam() {
      widget.model.toggleActiveTeam();
    }

    _setScoreForTeam(Team team, TextEditingController textController) {
      team.setScore(double.parse(textController.text));
    }

    TextEditingController team1ScoreTextFieldController =
      TextEditingController( text: widget.model.teams[0].score.toString() );

    TextEditingController team2ScoreTextFieldController =
        TextEditingController(text: widget.model.teams[1].score.toString());

    TextEditingController activeScoreTextFieldController =
      TextEditingController(text: widget.model.activeScore.toString());



      //todo: is there a better way to parse the caller to the method?
    team1ScoreTextFieldController.addListener(() {
      _setScoreForTeam(widget.model.teams[0], team1ScoreTextFieldController);
    });

    team2ScoreTextFieldController.addListener(() {
      _setScoreForTeam(widget.model.teams[1], team2ScoreTextFieldController);
    });

    activeScoreTextFieldController.addListener(() {
      widget.model.setActiveScore(double.parse(activeScoreTextFieldController.text));
    });


    return Form(
        key: _formKey,
        child: Center(
            child: Column(
          children: <Widget>[
            Text(
              'Active Team',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                    value: widget.model.teams[0].id,
                    groupValue: widget.model.activeTeam,
                    onChanged: (newValue) {
                      _toggleActiveTeam();
                    }),
                Radio(
                    value: widget.model.teams[1].id,
                    groupValue: widget.model.activeTeam,
                    onChanged: (newValue) {
                      _toggleActiveTeam();
                    }),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: widget.model.teams[0].id,
              ),
              controller: team1ScoreTextFieldController,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: widget.model.teams[1].id,
              ),
              controller: team2ScoreTextFieldController,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Active Score',
              ),
//              initialValue: widget.model.activeScore.toString(),
              controller: activeScoreTextFieldController,
            ),
          ],
        )));
  }
}
