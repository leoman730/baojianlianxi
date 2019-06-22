import 'package:flutter/material.dart';

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
//              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
      ),
    );
  }
}
