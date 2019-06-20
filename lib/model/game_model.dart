import 'package:scoped_model/scoped_model.dart';

class GameModel extends Model {
  double _score = 100.00;
  bool _isActive = false;
  String _name = 'team name';

  List <Team> _teams = [new Team('team1'), new Team('team2')];

  double get score => _score;
  String get name => _name;
  List get teams => _teams;


//  var _questions = {
//    '新約聖經題目 1': ['10 分', '20 分','30 分','40 分','50 分'],
//    "新約聖經題目 2": ['10 分', '20 分','30 分','40 分','50 分'],
//    '團契教會題': ['10 分', '20 分','30 分','40 分','50 分'],
//    '常識題': ['10 分', '20 分','30 分','40 分','50 分'],
//    '猜猜我是誰': ['10 分', '20 分','30 分','40 分','50 分'],
//    '飲食男女': ['10 分', '20 分','30 分','40 分','50 分'],
//  };


  List _game_status = [
    [{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false}],
    [{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false}],
    [{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false}],
    [{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false}],
    [{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false},{'id':'1-0', 'dirty': false}],
  ];

  List _questions = [
  {
    'key': '新約聖經題目 1',
    'questions': [
      {'id':'1-1', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 10, 'image': 'assets/images/splash.png' },
      {'id':'1-2', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 20 },
      {'id':'1-3', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 30 },
      {'id':'1-4', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 40 },
      {'id':'1-5', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 50 },
      ]
  },

  {
    'key': '新約聖經題目 2',
    'questions': [
      {'id':'2-1', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 10 },
      {'id':'2-2', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 20 },
      {'id':'2-3', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 30 },
      {'id':'2-4', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 40 },
      {'id':'2-5', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 50 },
    ]
  },
  ];
//    '新約聖經題目 2', '團契教會題', '常識題', '猜猜我是誰', '飲食男女'];


  List get gameStatus => _game_status;
  List get questions => _questions;

  void toggleActive() {
    _isActive = !_isActive;
    notifyListeners();
  }
}

class Team extends Model {
  double score = 100;
  String id = 'undefined';

  Team(this.id);

  void increment(value) {
    score = score + value;
    // Then notify all the listeners.
    notifyListeners();
  }

  void decrement(value) {
    score = score - value;
    // Then notify all the listeners.
    notifyListeners();
  }
}

class Question extends Model {
  int _score;
  String _question;
  String _answer;
  String _image;
  String _id;

  Question(Map args) {
    this._id = args['id'];
    this._question = args['question'];
    this._answer = args['answer'];
    this._score = args['score'];
    this._image = args['image'];
  }

  String get id => this._id;
  String get question => this._question;
  String get answer => this._answer;
  int get score => this._score;
  String get image => this._image;

}
