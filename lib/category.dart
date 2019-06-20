import 'package:flutter/material.dart';
import 'package:game/model/game_model.dart';
import 'category_name_card.dart';
import 'question_name_card.dart';

class CategoryColumnWidget extends StatelessWidget {
  String categoryName;
  List questions;

  CategoryColumnWidget(questionSet) {
    this.categoryName = questionSet['key'];
    this.questions = questionSet['questions'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Print category name.
        CategoryNameCard(this.categoryName),
        Expanded(
          // Building a list of card for question vertically.
          child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
//                print(questions[index]);
                Question question = Question(questions[index]);
                return QuestionCard(question);
              })),
      ],
    );
  }
}



