import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final String name;

  QuestionCard(this.name);

  @override
  QuestionCardState createState() => QuestionCardState();
}

class QuestionCardState extends State <QuestionCard> {
  bool has_opened = false;

  @override
  Widget build(BuildContext context) {
    // Todo: This card needs to look better.
    return new Container(
      height: 50,
      decoration: new BoxDecoration(
        color: new Color(0xff4caf50),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      margin: new EdgeInsets.all(5.0),
      child: new Center(
        child: Text(widget.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
      ),
    );
  }

}

