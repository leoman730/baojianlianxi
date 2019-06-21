import 'package:scoped_model/scoped_model.dart';

class GameModel extends Model {
  double _score = 100.00;
  bool _isActive = false;
  String _name = 'team name';
  String activeTeam;
  double activeScore = 10.00;
  List _questions;
  Map gameCardStatus;

  List <Team> _teams;

  double get score => _score;
  String get name => _name;
  List get teams => _teams;


  GameModel() {
    _teams = [new Team('team1'), new Team('team2')];
    toggleActiveTeam();
    _questions = _getQuestions();
    gameCardStatus = _generateGameCardStatus();
  }


  List _getQuestions() {
    List questions = [
      {
        'key': '新約聖經題目 1',
        'questions': [
          {
            'id':'1-1',
            'question': '為什麼創世記第11章中記載遠古時代人類要建造巴別塔？\n\nA、因為當時天下認得口音、語言都是一樣 \n\nB、 因為神要人類生養眾多，變慢地面，致力萬物 \n\nC、因為想要傳揚自己的名，免得分散到全地 \n\nD、以上都對',
            'answer': '答案： C'
                '',
            'score': 10,
            'image': 'assets/images/splash.png'
          },
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

      {
        'key': '新約聖經題目 3',
        'questions': [
          {'id':'2-1', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 10 },
          {'id':'2-2', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 20 },
          {'id':'2-3', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 30 },
          {'id':'2-4', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 40 },
          {'id':'2-5', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 50 },
        ]
      },
      {
        'key': '新約聖經題目 4',
        'questions': [
          {'id':'2-1', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 10 },
          {'id':'2-2', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 20 },
          {'id':'2-3', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 30 },
          {'id':'2-4', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 40 },
          {'id':'2-5', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 50 },
        ]
      },
      {
        'key': '新約聖經題目 5',
        'questions': [
          {'id':'2-1', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 10 },
          {'id':'2-2', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 20 },
          {'id':'2-3', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 30 },
          {'id':'2-4', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 40 },
          {'id':'2-5', 'question': 'this is my question', 'answer': 'this is my answer', 'score': 50 },
        ]
      },
    ];

    return questions;
  }

  List get questions => _questions;

  Map _generateGameCardStatus() {
    Map cardStatus = {};
    this._questions.forEach((items) {
      items['questions'].forEach((question) {
        cardStatus[question['id']]= false;
      });
    });

    return cardStatus;
  }


  void toggleActiveTeam() {
    this.activeTeam = (this.activeTeam == this.teams[0].id) ? this.teams[1].id : this.teams[0].id;
    notifyListeners();
  }

  void setActiveScore(double value) {
    print('set active score to: ' + value.toString());
    this.activeScore = value;
  }

  setTeamScore(id, value) {
    Team team = this.findTeamById(id);
    team.score = value;
  }

  bool getCardStatus(id) {
//    id = int.parse(id);
  print(gameCardStatus);
    return this.gameCardStatus[id];
  }

  void setCardStatus(id, hasOpened) {
    this.gameCardStatus[id] = hasOpened;
  }

  Team findTeamById(id) {
    Team candidate;
    teams.forEach((team) {
      if (team.id == id) {
        candidate = team;
      }
    });

    return candidate;
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

  void setScore(value) {
    print('team: '+ this.id);
    print('score set to ' + value.toString() );
    score = value;
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
