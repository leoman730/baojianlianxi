import 'package:flutter/material.dart';
import 'screen/readme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/game_model.dart';

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
      child: MaterialApp(
          title: '寶劍練習',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => ReadmeScreen(),
          },
        )
    );

  }
}





