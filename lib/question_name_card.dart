import 'package:flutter/material.dart';
import 'screen/question_screen.dart';


class QuestionCard extends StatefulWidget {
  final String name;

  QuestionCard(this.name);

  @override
  QuestionCardState createState() => QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  bool has_opened = false;

//  Future<void> _showQuestion() async{
//    return showDialog<void>(
//      context: context,
//      barrierDismissible: false, // user must tap button!
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: Text('Rewind and remember'),
//          content: SingleChildScrollView(
//            child: ListBody(
//              children: <Widget>[
//                Text('You will never be satisfied.'),
//                Text('You\’re like me. I’m never satisfied.'),
//              ],
//            ),
//          ),
//          actions: <Widget>[
//            FlatButton(
//              child: Text('Regret'),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }


  _showQuestion() {
//    cardKey.currentState.toggleCard();
    Navigator.push(context,
        MaterialPageRoute( builder: (context) => QuestionScreen()));
  }



  @override
  Widget build(BuildContext context) {
    // Todo: This card needs to look better.
    double _height = 50;
    double _width = MediaQuery.of(context).size.width;

    double elevation = 30;

    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(90),

          onTap: () {
            print('Card tapped.');
            _showQuestion();
          },
          child: Stack(
          children: <Widget>[
            Container(
              width: _width,
              height: _height,
              child: Image.network(
                'https://placeimg.com/640/480/any',
                fit: BoxFit.fill,
              ),
            ),
            Container(
                height: _height,
                child: Center(
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )),
          ],
        ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: elevation,
        margin: EdgeInsets.all(10),
      );
  }
}
