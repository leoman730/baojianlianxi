import 'package:flutter/material.dart';
import 'screen/readme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/game_model.dart';
import 'screen/section1.dart';
import 'screen/activity_manager.dart';


void main() => runApp(MyApp(
  gameModel: GameModel()
));

class MyApp extends StatelessWidget {
  final GameModel gameModel;

  const MyApp({
    Key key,
    @required this.gameModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<GameModel> (
      model: gameModel,
      child:
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '寶劍練習',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Kai Bold',
            // If a widget want to use default style, it should use reference.
            // see: https://flutter.dev/docs/cookbook/design/themes
            textTheme: TextTheme(
                title: TextStyle(
                fontSize: 40
              )
            )
          ),
//          initialRoute: '/',
          home: ReadmeScreen(),
          routes: {
          '/section1': (context) => Section1Screen(),
          },

        )
    );
  }


}





