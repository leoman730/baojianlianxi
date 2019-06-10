import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  String categoryName;
  List questions;

  CategoryWidget(categoryName, questions) {
    this.categoryName = categoryName;
    this.questions = questions;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CategoryNameCard(this.categoryName),
        Expanded(
            child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
//                  return Text(questions[index]);
                  return QuestionCard(questions[index]);
                })),
      ],
    );
  }
}

class CategoryNameCard extends StatelessWidget {
  String name;

  CategoryNameCard(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      decoration: new BoxDecoration(
        color: new Color(0xff009688),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      margin: new EdgeInsets.all(5.0),
      child: new Center(
        child: Text(this.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
      ),
    );
  }
}


class QuestionCard extends StatefulWidget {
  String name;

  QuestionCard(String name) {
    this.name = name;
  }

  @override
  QuestionCardState createState() => QuestionCardState(this.name);
}

class QuestionCardState extends State <QuestionCard> {
  String name;
  bool has_opened = false;

  QuestionCardState(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      decoration: new BoxDecoration(
        color: new Color(0xff4caf50),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      margin: new EdgeInsets.all(5.0),
      child: new Center(
        child: Text(this.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
      ),
    );
  }

}

