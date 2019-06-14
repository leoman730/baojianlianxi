import 'package:flutter/material.dart';
import 'category_name_card.dart';
import 'question_name_card.dart';

class CategoryColumnWidget extends StatelessWidget {
  String categoryName;
  List questions;

  CategoryColumnWidget(categoryName, questions) {
    this.categoryName = categoryName;
    this.questions = questions;
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
                return QuestionCard(questions[index]);
              })),
      ],
    );
  }
}



