import 'package:flutter/material.dart';
import 'screen/readme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '寶劍練習',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: '寶劍練習'),
      initialRoute: '/',
      routes: {
        '/': (context) => ReadmeScreen(),
//        '/section1': (context) => Section1Screen(),
      },
    );
  }
}





